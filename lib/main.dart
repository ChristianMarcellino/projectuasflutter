import 'package:flutter/material.dart';
import 'package:projectuas/data/buku_data.dart';
import 'package:projectuas/screen/alert_screen.dart';
import 'package:projectuas/screen/home_screen.dart';
import 'package:projectuas/screen/profile_screen.dart';
import 'package:projectuas/screen/saved_screen.dart';
import 'package:projectuas/screen/splash_screen.dart';
import 'package:flutter/foundation.dart' show kIsWeb; // TAMBAHKAN
import 'package:projectuas/helper/database_helper.dart'; // TAMBAHKAN

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Future<void> _initializeDatabase() async {
    try {
      final dbHelper = DatabaseHelper();

      print('Checking database status...');

      // Check apakah database sudah memiliki data
      final isEmpty = await dbHelper.isDatabaseEmpty();

      if (isEmpty) {
        print('Database empty, migrating data...');

        // Migrasi data dari static list ke database
        await dbHelper.insertBukuList(bukuList);

        print('Data candi berhasil dimigrasikan ke database');
      } else {
        print('Database sudah memiliki data');
      }
    } catch (e) {
      print('Database initialization error: $e');
      rethrow;
    }
  }

  if (kIsWeb) {
    try {
      await _initializeDatabase();
    } catch (e) {
      print("Error Initializing Database $e");
    }
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
          ),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
      ),
      home: SplashScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    HomeScreen(),
    SavedScreen(),
    AlertScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF030712),
      body: _screens[_currentIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(canvasColor: Color(0xFF111827)),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          selectedItemColor: Color(0xFFC084FC),
          unselectedItemColor: Color(0xFF6B7280),
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: "Saved"),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: "Alert",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
        ),
      ),
    );
  }
}
