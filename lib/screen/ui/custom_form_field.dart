import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final bool obscurePassword;
  final Widget? suffixIcon;
  const CustomFormField({
    required this.label,
    required this.controller,
    required this.hint,
    this.obscurePassword = false,
    this.suffixIcon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(color: Color(0xFFD1D5DB), fontSize: 16)),
        SizedBox(height: 4),
        TextFormField(
          controller: controller,
          style: TextStyle(color: Color(0xFFD1D5DB)),
          obscureText: obscurePassword,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Color(0xFF6B7280)),
            fillColor: Color(0xFF1F2937),
            suffixIcon: suffixIcon,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
          ),
        ),
      ],
    );
  }
}
