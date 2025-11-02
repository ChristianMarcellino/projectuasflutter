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
    _timer = Timer(Duration(seconds: 3), (){
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context)=> RegisterScreen()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : Center(
        child: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(color: Colors.lightBlue, shape: BoxShape.circle),
          child: ClipOval(
            child: SizedBox.fromSize(
              size: Size.fromRadius(48), // Image radius
              child: Image.network('https://e7.pngegg.com/pngimages/134/63/png-clipart-ipod-touch-app-store-apple-widget-random-icons-angle-logo-thumbnail.png', fit: BoxFit.cover),
            ),
          ),
        ),
      )
    );
  }
}
