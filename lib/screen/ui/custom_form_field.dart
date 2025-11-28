import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final bool obscurePassword;
  final Widget? suffixIcon;
  final String? errorText;
  const CustomFormField({
    required this.label,
    required this.controller,
    required this.hint,
    this.obscurePassword = false,
    this.errorText,
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
          autofocus: false,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Color(0xFF6B7280)),
            fillColor: Color(0xFF1F2937),
            suffixIcon: suffixIcon,
            errorText: errorText,
            filled: true,
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF374151)),
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF707070)),
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
          ),
        ),
      ],
    );
  }
}
