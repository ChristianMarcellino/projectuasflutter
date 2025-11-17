import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projectuas/screen/ui/button.dart';

class SaveScreen extends StatefulWidget {
  const SaveScreen({super.key});

  @override
  State<SaveScreen> createState() => _SaveScreen();
}

class _SaveScreen extends State<SaveScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF030712),
      appBar: AppBar(
        backgroundColor: Color(0xFF111827),
        title: Text("Saved Books"), titleTextStyle: TextStyle(
          color: Color(0xFFD1D5DB),
          fontSize: 20,
          fontWeight: FontWeight.bold
        ),
      ),

      body: Stack(
        children: [
          Button(onPressed: () {}, title: title, icon: Icons.arrow_back,)
        ],
      )
    );
  }
}
