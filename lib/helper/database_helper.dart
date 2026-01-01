import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:projectuas/model/buku.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io' show Platform;
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  // Singleton pattern - memastikan hanya ada satu instance DatabaseHelper
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  // Factory constructor untuk mengembalikan instance yang sama
  factory DatabaseHelper() {
    return _instance;
  }

  // Private constructor
  DatabaseHelper._internal();

  // Getter untuk mendapatkan database
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    // Untuk Web platform
    if (kIsWeb) {
      databaseFactory = databaseFactoryFfiWeb;
      return await openDatabase(
        'perpustakaan.db',
        version: 1,
        onCreate: _onCreate,
      );
    }

    // Untuk Desktop (Windows, Linux, macOS)
    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;
      final appDocumentsDirectory = await getApplicationDocumentsDirectory();
      String path = join(appDocumentsDirectory.path, 'perpustakaan.db');
      print('📁 Database location (Desktop): $path');
      return await openDatabase(path, version: 1, onCreate: _onCreate);
    }

    // Untuk Mobile (Android/iOS)
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'perpustakaan.db');
    print('📁 Database location (Mobile): $path');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE buku (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        writer TEXT NOT NULL,
        category TEXT NOT NULL,
        description TEXT NOT NULL,
        availability INTEGER NOT NULL DEFAULT 0,
        isSaved INTEGER NOT NULL DEFAULT 0,
        rating REAL NOT NULL,
        pages INTEGER NOT NULL,
        imageUrl TEXT NOT NULL
      )
  ''');
  }

  // Insert single record
  Future<int> insertBuku(Buku buku) async {
    final db = await database;
    return await db.insert('buku', buku.toMap());
  }

  // Insert batch (untuk migrasi data)
  Future<void> insertBukuList(List<Buku> bukuList) async {
    final db = await database;
    Batch batch = db.batch();
    for (var buku in bukuList) {
      batch.insert('buku', buku.toMap());
    }
    await batch.commit(noResult: true);
  }

  Future<int> toggleFavorite(int id, bool isSaved) async {
    final db = await database;
    return await db.update(
      'buku',
      {'isSaved': isSaved ? 1 : 0},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Get all
  Future<List<Buku>> getAllBuku() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('buku');
    return List.generate(maps.length, (i) {
      return Buku.fromMap(maps[i]);
    });
  }

  // Get by ID
  Future<Buku?> getBukuById(int id) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'buku',
      where: 'id = ?',
      whereArgs: [id],
    );
    if (maps.isEmpty) return null;
    return Buku.fromMap(maps[0]);
  }

  // Get favorites
  Future<List<Buku>> getFavoriteBuku() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'buku',
      where: 'isSaved = ?',
      whereArgs: [1],
    );
    return List.generate(maps.length, (i) {
      return Buku.fromMap(maps[i]);
    });
}

  Future<bool> isDatabaseEmpty() async {
    final db = await database;
    final count = Sqflite.firstIntValue(
      await db.rawQuery('SELECT COUNT(*) FROM buku'),
    );
    return count == 0;
  }

  // Close database
  Future<void> close() async {
    final db = await database;
    db.close();
  }
}
