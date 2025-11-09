import 'dart:async';

import 'package:flutter/material.dart';
import 'package:projectuas/screen/home_screen.dart';
import 'package:projectuas/screen/register_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(Duration(seconds: 1), (){
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context)=> HomeScreen()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body : Center(
        child: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(shape: BoxShape.circle),
          child: ClipOval(
            child: SizedBox.fromSize(
              size: Size.fromRadius(48), // Image radius
              child: Image.network('https://s3-alpha.figma.com/hub/file/2721803157/3f021816-bde1-4634-80b3-52d7f762bc6b-cover.png', fit: BoxFit.cover),
            ),
          ),
        ),
      )
    );
  }
}
