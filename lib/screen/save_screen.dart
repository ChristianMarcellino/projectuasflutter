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
          crossAxisAlignment: CrossAxisAlignment.start,
        children : [
          Text("Saved Books", style: TextStyle(
          color: Color(0xFFD1D5DB),
          fontSize: 20,
          fontWeight: FontWeight.bold
        ),
       ),
          
          Text("3 books in your collection", style: 
               TextStyle(color : Colors.white54, fontSize: 13),           
        ),
       ],
      ),

        actions: [
          Icon(Icons.bookmark,
               color: Colors.purpleAccent, size: 26),
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
              child : Row (
                crossAxisAlignment: CrossAxisAlignment.start, 
                children : [
                  Text("The Great Adventure", 
                    style : const TextStyle(
                      color : Colors.white,
                      fontSize : 10, 
                      fontWeight : FontWeight.bold
                    ),
                  ),
                  Text ("Sarah Mitchell", 
                    style : const TextStyle(
                      color : Colors.grey,
                      fontSize : 5
                    ),
                  ),
                  Chip (
                    label: Text(
                      "Fiction", style: TextSytle(color: Colors.white, fontSize: 12,
                      ), 
                    ), 
                    backgroundColor: Colors.purple, 
                  ),
                  Row (
                    children: [
                      Icon(
                        Icons.star, 
                        color: Colors.yellow, 
                        size: 18,
                      ), 
                      SizedBox(width: 4), 
                      Text(
                        "4.8",
                        style: TextStyle(
                          color: Colors.white, 
                          fontSize: 18,
                          fontweight : FontWeight.bold, 
                        ), 
                      ), 
                      Icon(
                        Icons.time, 
                        color: Colors.grey, 
                        size: 18,
                      ), 
                      SizedBox(width: 4), 
                      Text("342p",
                          style: TextStyle(
                            color: Colors.grey, 
                            fontSize: 18,
                          ), 
                      ), 
                    ], 
                  ), 
                  Text("Saved 2 days ago", 
                      style: TextStyle(
                        color: Colors.grey, 
                        fontSize: 18
                      ), 
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
