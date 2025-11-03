import 'package:flutter/material.dart';
import 'package:projectuas/screen/login_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Align(
              alignment: AlignmentGeometry.topRight,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white54,
                  textStyle: TextStyle(decoration: TextDecoration.underline),
                ),
                child: Text("Sign in"),
              ),
            ),
            SizedBox(height: 16,),
            Align(
              alignment: AlignmentGeometry.center,
              child : Text("Libgen", style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),)
            ),
            SizedBox(height: 16,),
            Align(
              alignment: AlignmentGeometry.center,
              child : Text("Create an account", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)
            ),
            Align(
              alignment: AlignmentGeometry.center,
              child : Text("Enter your email to sign up for this app", style: TextStyle(color: Colors.white),)
            ),
            SizedBox(height: 16,),
            CircleAvatar(
              radius: 50,
              child: Icon(Icons.person, size: 40,),
            ),
            SizedBox(height: 20,),
            Text("Email"),
            Input
          ],
        ),
      ),
    );
  }
}
