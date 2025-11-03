import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projectuas/screen/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
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
            TextFormField(
              controller : _emailController,
              style: TextStyle(
                color: Colors.white
              ),
              decoration: InputDecoration(
                  labelText: "Username",
                  labelStyle: TextStyle(
                    color : Colors.white
                  ),
                  border: OutlineInputBorder(),
                ),
            ),
            SizedBox(height: 16,),
            TextFormField(
              controller : _passwordController,
              style : TextStyle(
                color: Colors.white
              ),
              decoration: InputDecoration(
                labelText: "Password",
                labelStyle: TextStyle(
                  color: Colors.white
                ),
                border: OutlineInputBorder()
              ),
            )
            
          ],
        ),
      ),
    );
  }
}