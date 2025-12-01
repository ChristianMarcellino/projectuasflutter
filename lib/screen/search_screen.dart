// import 'package:flutter/material.dart';
// import 'package:projectuas/screen/ui/custom_form_field.dart';

// class SearchScreen extends StatefulWidget {
//   const SearchScreen({super.key});

//   @override
//   State<SearchScreen> createState() => _SearchScreenState();
// }

// class _SearchScreenState extends State<SearchScreen> {
  

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Column(
//         children: [
          
//           SizedBox(
//             height: 500,
//             child: ListView.builder(
//               itemCount: _filteredBooks.length,
//               itemBuilder: (context, index) {
//                 final book = _filteredBooks[index];
//                 return Card(
//                   margin: EdgeInsets.all(8),
//                   color: Color(0xFF111827),
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Expanded(
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         spacing: 20,
//                         children: [
//                           ClipRRect(
//                             child: Image.network(
//                               "https://picsum.photos/id/237/200/300",
//                               fit: BoxFit.cover,
//                               width: 40,
//                               height: 80,
//                             ),
//                           ),
//                           Expanded(
//                             child: Column(
//                               children: [
//                                 Text(
//                                   book["name"],
//                                   style: TextStyle(color: Colors.yellow),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
