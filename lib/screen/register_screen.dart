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
  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF030712),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFF111827),
              border: Border.all(color: Color(0xFF1F2937)),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Icon(Icons.book, color: Colors.lightBlue, size: 80),
                  ),
                  SizedBox(height: 16),
                  Align(
                    alignment: AlignmentGeometry.center,
                    child: Text(
                      "Join the Library",
                      style: TextStyle(color: Color(0xFFD1D5DB), fontSize: 16),
                    ),
                  ),
                  Align(
                    alignment: AlignmentGeometry.center,
                    child: Text(
                      "Enter your email to sign up for this app",
                      style: TextStyle(color: Color(0xFF9CA3AF)),
                    ),
                  ),

                  SizedBox(height: 20),
                  Text(
                    "Email",
                    style: TextStyle(color: Color(0xFFD1D5DB), fontSize: 16),
                  ),
                  SizedBox(height: 4),
                  TextFormField(
                    controller: _emailController,
                    style: TextStyle(color: Color(0xFFD1D5DB)),
                    decoration: InputDecoration(
                      hintText: "Enter your email",
                      hintStyle: TextStyle(color: Color(0xFF9CA3AF)),
                      fillColor: Color(0xFF1F2937),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                      ),
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Username",
                    style: TextStyle(color: Color(0xFFD1D5DB), fontSize: 16),
                  ),
                  SizedBox(height: 4),
                  TextFormField(
                    controller: _usernameController,
                    style: TextStyle(color: Color(0xFFD1D5DB)),
                    decoration: InputDecoration(
                      hintText: "Enter your name",
                      hintStyle: TextStyle(color: Color(0xFF9CA3AF)),
                      fillColor: Color(0xFF1F2937),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                      ),
                    ),
                  ),
                  Text(
                    "Password",
                    style: TextStyle(color: Color(0xFFD1D5DB), fontSize: 16),
                  ),
                  SizedBox(height: 4),
                  TextFormField(
                    controller: _passwordController,
                    style: TextStyle(color: Color(0xFFD1D5DB)),
                    decoration: InputDecoration(
                      hintText: "Create a password",
                      hintStyle: TextStyle(color: Color(0xFF9CA3AF)),
                      fillColor: Color(0xFF1F2937),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: 
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    child: Text("Wawan"),
                  ),
                  // Align(
                  //   alignment: AlignmentGeometry.topRight,
                  //   child: TextButton(
                  //     onPressed: () {
                  //       Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //           builder: (context) => const LoginScreen(),
                  //         ),
                  //       );
                  //     },
                  //     style: TextButton.styleFrom(
                  //       foregroundColor: Colors.white54,
                  //       textStyle: TextStyle(
                  //         decoration: TextDecoration.underline,
                  //       ),
                  //     ),
                  //     child: Text("Sign in"),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
