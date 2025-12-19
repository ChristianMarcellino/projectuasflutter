// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:projectuas/model/buku.dart';
// import 'package:projectuas/screen/ui/custom_form_field.dart';
// import 'package:projectuas/data/buku_data.dart';

// class SaveScreeen extends StatefulWidget {
//   const SaveScreen({super.key});

//   @override
//   State<SaveScreen> createState() => _SaveScreen();
// }

// class _SaveScreen extends State<SaveScreen> {
//   final TextEditingController _searchController = TextEditingController();

//   String searchQuery = "";



//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFF030712),
//       //app bar
//       appBar: AppBar(
//         toolbarHeight: MediaQuery.of(context).size.height / 5,
//         backgroundColor: Color(0xFF111827),
//         automaticallyImplyLeading: false,
//         title: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Row(
//               children: [
//                 Icon(Icons.arrow_back, color: Colors.purple),
//                 SizedBox(width: 10),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "Saved Books",
//                       style: TextStyle(
//                         color: Color(0xFFD1D5DB),
//                         fontSize: 13,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Text(
//                       "3 books in your collection",
//                       style: TextStyle(color: Colors.white54, fontSize: 13),
//                     ),
//                   ],
//                 ),
//               ],
//             ),

//             CustomFormField(
//               label: "",
//               controller: _searchController,
//               hint: "Search Book",
//               suffixIcon: Icon(Icons.search),
//             ),
//           ],
//         ),
//       ),

//       //body
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),

//         child: Column(children: [
//             Container(
//               padding: const EdgeInsets.symmetric(horizontal: 14),
//               decoration: BoxDecoration(
//                 color: const Color(0xFF1A1F32),
//                 borderRadius: BorderRadius.circular(14),
//               ),

//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(10),
//                     child: Image.asset(
//                       'images/Gambar_1.jpg',
//                       width: 80,
//                       height: 150,
//                       fit: BoxFit.cover,
//                     ),
//                   ),

//                   SizedBox(width: 12),

//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "The Great Adventure",
//                           style: const TextStyle(
//                             color: Colors.white,
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         Text(
//                           "Sarah Mitchell",
//                           style: const TextStyle(
//                             color: Colors.grey,
//                             fontSize: 15,
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(10.0),
//                           child: Chip(
//                             label: Text(
//                               "Fiction",
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 15,
//                               ),
//                             ),
//                             backgroundColor: const Color(0xFF151a2b),
//                           ),
//                         ),
//                         Row(
//                           children: [
//                             Icon(Icons.star, color: Colors.yellow, size: 15),
//                             SizedBox(width: 4),
//                             Text(
//                               "4.8",
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 15,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             SizedBox(width: 10),
//                             Icon(Icons.circle, color: Colors.grey, size: 15),
//                             SizedBox(width: 4),
//                             Text(
//                               "342p",
//                               style: TextStyle(
//                                 color: Colors.grey,
//                                 fontSize: 15,
//                               ),
//                             ),
//                           ],
//                         ),
//                         Row(
//                           children: [
//                             Text(
//                               "Saved 2 days ago",
//                               style: TextStyle(
//                                 color: Colors.grey,
//                                 fontSize: 20,
//                               ),
//                             ),
//                             Expanded(child: Container(width: double.infinity)),
//                             IconButton(
//                               icon: Icon(Icons.delete, color: Colors.grey),
//                               onPressed: () {
//                                 //handle delete action here
                                 
//                               },
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             SizedBox(height: 16),

//             Container(
//               padding: const EdgeInsets.symmetric(horizontal: 14),
//               decoration: BoxDecoration(
//                 color: const Color(0xFF1A1F32),
//                 borderRadius: BorderRadius.circular(14),
//               ),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Image.asset(
//                     'images/Gambar_1.jpg',
//                     width: 80,
//                     height: 120,
//                     fit: BoxFit.cover,
//                   ),
//                   SizedBox(width: 12),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                       Text(
//                         'hoho'
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }