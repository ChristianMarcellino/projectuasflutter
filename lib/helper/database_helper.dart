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
  if (kIsWeb) {
    databaseFactory = databaseFactoryFfiWeb;
    return await openDatabase(
      'perpustakaan.db',
      version: 1,
      onCreate: _onCreate,
    );
  }

  // Diluar Web
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;

  final appDocumentsDirectory =
      await getApplicationDocumentsDirectory();

  final path = join(appDocumentsDirectory.path, 'perpustakaan.db');
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
        imageUrl TEXT NOT NULL,
        published INTEGER NOT NULL
      )
  ''');
  }

  // Insert batch
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
      {'isSaved': isSaved ? 0 : 1},
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
}
