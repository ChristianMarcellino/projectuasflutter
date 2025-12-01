import 'package:flutter/material.dart';
import 'package:projectuas/main.dart';
import 'package:projectuas/screen/register_screen.dart';
import 'package:projectuas/screen/ui/custom_form_field.dart';
import 'package:projectuas/screen/ui/button.dart';
import 'package:projectuas/screen/ui/redirect_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? _errorText;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isSignedIn = false;

  void signIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String savedEmail = prefs.getString("email") ?? "";
    final String savedPassword = prefs.getString("password") ?? "";
    final String enteredEmail = _emailController.text.trim();
    final String enteredPassword = _passwordController.text.trim();

    if (savedEmail.isEmpty || savedPassword.isEmpty) {
      setState(() {
        _errorText = "Akun Belum Terdaftar";
      });
      return;
    } else if (enteredEmail != savedEmail || enteredPassword != savedPassword) {
      setState(() {
        _errorText = "Email atau Password Salah";
      });
      return;
    } else if (enteredEmail.isEmpty || enteredPassword.isEmpty) {
      setState(() {
        _errorText = "Email dan Password Wajib Diisi";
      });
      return;
    } else {
      setState(() {
        _errorText = "";
        isSignedIn = true;
      });
    }

    if (isSignedIn) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MainScreen()),
      );
    }
  }

  bool _obscurePassword = true;
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
                    errorText: _errorText,
                  ),

                  SizedBox(height: 8),
                  CustomFormField(
                    label: "Password",
                    controller: _passwordController,
                    hint: "Enter your password",
                    obscurePassword: _obscurePassword,
                    errorText: _errorText,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                      icon: (_obscurePassword
                          ? Icon(Icons.visibility_off)
                          : Icon(Icons.visibility)),
                    ),
                  ),

                  SizedBox(height: 16),
                  Center(
                    child: Container(
                      width: MediaQuery.sizeOf(context).width,
                      child: Button(
                        icon: Icons.login,
                        title: "Sign In",

                        onPressed: () {
                          signIn();
                        },
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
