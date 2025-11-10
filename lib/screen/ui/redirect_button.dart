import 'package:flutter/material.dart';

class RedirectButton extends StatelessWidget {
  final String title;
  final Widget destination;
  final IconData icon;
  const RedirectButton({required this.icon ,required this.title, required this.destination, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Color(0xFF2563EB))
      ),
      child: ElevatedButton(
        child: Row(mainAxisAlignment: MainAxisAlignment.center,spacing: 2.0, children: [Icon(icon, color: Color(0xFF60A5FA),), Text(title, style: TextStyle(color: Color(0xFF60A5FA)),)],),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => destination),
          );
        },
      ),
    );
  }
}
