// dart
  // File: `lib/screen/ui/button.dart`
  import 'package:flutter/material.dart';

  class Button extends StatelessWidget {
    final String title;
    final IconData? icon;
    final GestureTapCallback onPressed;
    const Button({required this.onPressed, this.icon, required this.title, super.key});

    @override
    Widget build(BuildContext context) {
      return Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), gradient: LinearGradient(colors: [Color(0xFF9333EA), Color(0xFF2563EB)])),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent, shadowColor: Colors.transparent),
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[Icon(icon, color: Colors.white), SizedBox(width: 6)],
              Text(title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      );
    }
  }