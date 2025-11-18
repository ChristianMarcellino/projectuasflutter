import 'package:flutter/material.dart';
import 'package:projectuas/screen/home_screen.dart';
import 'package:projectuas/screen/login_screen.dart';
import 'package:projectuas/screen/save_screen.dart';
import 'package:projectuas/screen/splash_screen.dart';

void main() {
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
            shadowColor: Colors.transparent
          )
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
      ),
      home: SaveScreen(),
    );
  }
}

