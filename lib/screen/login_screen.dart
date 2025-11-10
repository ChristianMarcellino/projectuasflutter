import 'package:flutter/material.dart';
import 'package:projectuas/screen/register_screen.dart';
import 'package:projectuas/screen/ui/custom_form_field.dart';
import 'package:projectuas/screen/ui/button.dart';
import 'package:projectuas/screen/ui/redirect_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
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
              padding: const EdgeInsets.all(18.0),
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
                      "Welcome Back",
                      style: TextStyle(color: Color(0xFFD1D5DB), fontSize: 16),
                    ),
                  ),
                  Align(
                    alignment: AlignmentGeometry.center,
                    child: Text(
                      "Sign in to access your library",
                      style: TextStyle(color: Color(0xFF6B7280)),
                    ),
                  ),

                  SizedBox(height: 20),
                  CustomFormField(
                    label: "Email",
                    controller: _emailController,
                    hint: "Enter your email",
                  ),

                  SizedBox(height: 8),
                  CustomFormField(
                    label: "Password",
                    controller: _passwordController,
                    hint: "Enter your password",
                  ),

                  SizedBox(height: 16),
                  Center(
                    child: Container(
                      width: MediaQuery.sizeOf(context).width,
                      child: Button(
                        icon: Icons.login,
                        title: "Sign In",
                        onPressed: () {},
                      ),
                    ),
                  ),

                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(child: Divider()),
                      Text(
                        "  Don't have an account?  ",
                        style: TextStyle(color: Color(0xFF6B7280)),
                      ),
                      Expanded(child: Divider()),
                    ],
                  ),
                  SizedBox(height: 16),

                  Center(
                    child: Container(
                      width: MediaQuery.sizeOf(context).width,
                      child: RedirectButton(
                        icon: Icons.create,
                        title: "Create Account",
                        destination: RegisterScreen(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
