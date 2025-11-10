import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF111827),
        automaticallyImplyLeading: false,
        title: Container(
          alignment: AlignmentDirectional.topStart,
          width: MediaQuery.sizeOf(context).width,
          child: Column(
            children: [
              Align(
                alignment: AlignmentDirectional.topStart,
                child: Text(
                  "Library",
                  style: TextStyle(color: Color(0xFFD1D5DB), fontSize: 18),
                ),
              ),
              Align(
                alignment: AlignmentDirectional.topStart,
                child: Text(
                  "Explore our collection",
                  style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 14),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Color(0xFF030712),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.all(8.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFF374151)),
                  color: Color(0xFF1F2937),
                  borderRadius: BorderRadius.circular(30)
                ),
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    foregroundColor: Color(0xFF6B7280)
                  ),
                  child: Text("All"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
