import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projectuas/screen/register_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body : Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text("data", style: TextStyle(color: Colors.white),),
              Text("data", style: TextStyle(color: Colors.white)),
              Text("data", style: TextStyle(color: Colors.white)),
              ElevatedButton(onPressed: (){
                Navigator.push(context,
                MaterialPageRoute(builder: (context) => RegisterScreen()));
              }, child: Text("data"))
            ],
          ),
        ),
      )
    );
  }
}
