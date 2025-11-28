import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SaveScreen extends StatefulWidget {
  const SaveScreen({super.key});

  @override
  State<SaveScreen> createState() => _SaveScreen();
}

class _SaveScreen extends State<SaveScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF030712),
      appBar: AppBar(
        backgroundColor: Color(0xFF111827),
        title: const Column(
          children: [
            Row(
              children: [
                Icon(Icons.arrow_back, color: Colors.purple),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Saved Books",
                        style: TextStyle(
                          color: Color(0xFFD1D5DB),
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "3 books in your collection",
                        style: TextStyle(color: Colors.white54, fontSize: 13),
                      ),
                    ],
                ),
              ],
            ),
            //search
          ],
        ),
        actions: [
          Icon(Icons.bookmark, color: Colors.purpleAccent, size: 26),
          SizedBox(width: 16),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),

        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(
                color: const Color(0xFF1A1F32),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "The Great Adventure",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Sarah Mitchell",
                    style: const TextStyle(color: Colors.grey, fontSize: 15),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Chip(
                      label: Text(
                        "Fiction",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      backgroundColor: const Color(0xFF151a2b),
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow, size: 15),
                      SizedBox(width: 4),
                      Text(
                        "4.8",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 10),
                      Icon(Icons.circle, color: Colors.grey, size: 15),
                      SizedBox(width: 4),
                      Text(
                        "342p",
                        style: TextStyle(color: Colors.grey, fontSize: 15),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Saved 2 days ago",
                        style: TextStyle(color: Colors.grey, 
                        fontSize: 20),
                      ),
                      SizedBox(width: 1100),
                      Icon(Icons.delete, color: Colors.grey),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 16),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(
                color: const Color(0xFF1A1F32),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Mystery at Midnight",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Robert Blake",
                    style: const TextStyle(color: Colors.grey, fontSize: 15),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Chip(
                      label: Text(
                        "Mystery",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      backgroundColor: const Color(0xFF151a2b),
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow, size: 15),
                      SizedBox(width: 4),
                      Text(
                        "4.6",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 10),
                      Icon(Icons.circle, color: Colors.grey, size: 15),
                      SizedBox(width: 4),
                      Text(
                        "398p",
                        style: TextStyle(color: Colors.grey, fontSize: 15),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Saved 5 days ago",
                        style: TextStyle(color: Colors.grey, fontSize: 20),
                      ),
                      SizedBox(width: 1100),
                      Icon(Icons.delete, color: Colors.grey),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 16),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(
                color: const Color(0xFF1A1F32),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Classic Tales",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "James Anderson",
                    style: const TextStyle(color: Colors.grey, fontSize: 15),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Chip(
                      label: Text(
                        "Literature",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      backgroundColor: const Color(0xFF151a2b),
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow, size: 15),
                      SizedBox(width: 4),
                      Text(
                        "5.0",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 10),
                      Icon(Icons.circle, color: Colors.grey, size: 15),
                      SizedBox(width: 4),
                      Text(
                        "500p",
                        style: TextStyle(color: Colors.grey, fontSize: 15),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Saved 6 days ago",
                        style: TextStyle(color: Colors.grey, fontSize: 20),
                      ),
                      SizedBox(width: 1100),
                      Icon(Icons.delete, color: Colors.grey),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
