import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String title;
  final IconData icon;
  final GestureTapCallback onPressed;
  const Button({required this.onPressed, required this.icon, required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          colors: [Color(0xFF9333EA), Color(0xFF2563EB)],
        ),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 2.0,
          children: [
            Icon(icon, color: Colors.white),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        onPressed: onPressed,
      ),
    );
  }
}
