// import 'package:flutter/material.dart';

// class SavedBooksScreen extends StatefulWidget {
//   const SavedBooksScreen({super.key});

//   @override
//   State<SavedBooksScreen> createState() => _SavedBooksScreenState();
// }

// class _SavedBooksScreenState extends State<SavedBooksScreen> {
//   final TextEditingController _searchController = TextEditingController();

//   List<Map<String, dynamic>> savedBooks = [
//     {
//       "title": "The Great Adventure",
//       "author": "Sarah Mitchell",
//       "genre": "Fiction",
//       "rating": 4.8,
//       "pages": 342,
//       "image": "assets/book1.jpg",
//       "saved": "Saved 2 days ago",
//     },
//     {
//       "title": "Mystery at Midnight",
//       "author": "Robert Blake",
//       "genre": "Mystery",
//       "rating": 4.6,
//       "pages": 398,
//       "image": "assets/book2.jpg",
//       "saved": "Saved 5 days ago",
//     },
//     {
//       "title": "Classic Tales",
//       "author": "James Anderson",
//       "genre": "Literature",
//       "rating": 4.3,
//       "pages": 225,
//       "image": "assets/book3.jpg",
//       "saved": "Saved 1 week ago",
//     },
//   ];

//   String searchQuery = "";

//   @override
//   Widget build(BuildContext context) {
//     List<Map<String, dynamic>> filtered = savedBooks
//         .where((book) => book["title"].toLowerCase().contains(searchQuery))
//         .toList();

//     return Scaffold(
//       backgroundColor: const Color(0xFF0F1624),
//       appBar: AppBar(
//         backgroundColor: const Color(0xFF0F1624),
//         elevation: 0,
//         title: const Text(
//           "Saved Books",
//           style: TextStyle(fontSize: 22, color: Colors.white),
//         ),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () {},
//         ),
//         actions: const [
//           Padding(
//             padding: EdgeInsets.only(right: 12),
//             child: Icon(Icons.bookmark_add_outlined, color: Colors.white),
//           )
//         ],
//         bottom: PreferredSize(
//           preferredSize: const Size.fromHeight(60),
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//             child: TextField(
//               controller: _searchController,
//               onChanged: (value) {
//                 setState(() {
//                   searchQuery = value.toLowerCase();
//                 });
//               },
//               decoration: InputDecoration(
//                 hintText: "Search saved books...",
//                 filled: true,
//                 fillColor: const Color(0xFF1C2434),
//                 prefixIcon: const Icon(Icons.search, color: Colors.white70),
//                 hintStyle: const TextStyle(color: Colors.white54),
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(12),
//                   borderSide: BorderSide.none,
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(12),
//                   borderSide: BorderSide.none,
//                 ),
//               ),
//               style: const TextStyle(color: Colors.white),
//             ),
//           ),
//         ),
//       ),
//       body: ListView.builder(
//         padding: const EdgeInsets.all(16),
//         itemCount: filtered.length,
//         itemBuilder: (context, index) {
//           final book = filtered[index];

//           return Container(
//             margin: const EdgeInsets.only(bottom: 18),
//             padding: const EdgeInsets.all(14),
//             decoration: BoxDecoration(
//               color: const Color(0xFF1C2434),
//               borderRadius: BorderRadius.circular(18),
//             ),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(12),
//                   child: Image.asset(
//                     book["image"],
//                     width: 90,
//                     height: 110,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 const SizedBox(width: 14),

//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         book["title"],
//                         style: const TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                       ),
//                       const SizedBox(height: 4),
//                       Text(
//                         book["author"],
//                         style: const TextStyle(
//                           color: Colors.white60,
//                           fontSize: 14,
//                         ),
//                       ),
//                       const SizedBox(height: 6),

//                       Container(
//                         padding:
//                             const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                         decoration: BoxDecoration(
//                           color: Colors.purple.withOpacity(0.3),
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                         child: Text(
//                           book["genre"],
//                           style: const TextStyle(color: Colors.purpleAccent),
//                         ),
//                       ),

//                       const SizedBox(height: 8),
//                       Row(
//                         children: [
//                           const Icon(Icons.star, size: 18, color: Colors.yellow),
//                           const SizedBox(width: 4),
//                           Text(
//                             book["rating"].toString(),
//                             style: const TextStyle(color: Colors.white),
//                           ),
//                           const SizedBox(width: 10),
//                           Text(
//                             "${book["pages"]}p",
//                             style: const TextStyle(color: Colors.white70),
//                           ),
//                         ],
//                       ),

//                       const SizedBox(height: 6),
//                       Text(
//                         book["saved"],
//                         style: const TextStyle(color: Colors.white38, fontSize: 12),
//                       ),
//                     ],
//                   ),
//                 ),

//                 IconButton(
//                   onPressed: () {
//                     setState(() {
//                       savedBooks.remove(book);
//                     });
//                   },
//                   icon: const Icon(Icons.delete_outline, color: Colors.white54),
//                 )
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }