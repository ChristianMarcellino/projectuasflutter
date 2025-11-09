import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projectuas/screen/register_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF030712),
      body : SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.all(8.0),
          child: Column(
            children: [
              Container(
                alignment: AlignmentDirectional.topStart,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                  color: Color(0xFF111827)
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: AlignmentDirectional.topStart,
                      child: Text("Library", style: TextStyle(color: Colors.white,fontSize: 16),),
                    ),
                    Align(
                      alignment: AlignmentDirectional.topStart,
                      child : Text("Explore our collection", style: TextStyle(color: Colors.white),)
                    ),
                    SearchAnchor(builder: BuildContext context, suggestionsBuilder: suggestionsBuilder)
                  ],
                ),
              )

            ],
          )
        ),
      )
    );
  }
}
