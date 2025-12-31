import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projectuas/helper/database_helper.dart';
import 'package:projectuas/model/buku.dart';
import 'package:projectuas/screen/ui/custom_form_field.dart';
import 'package:projectuas/data/buku_data.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() => _SavedScreen();
}

class _SavedScreen extends State<SavedScreen> {
  final TextEditingController _searchController = TextEditingController();

  String searchQuery = "";
  List<Buku> savedBooks = [];

  @override
  void initState() {
    super.initState();
    savedBooks = bukuList.where((buku) => buku.isSaved).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF030712),
      //app bar
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height / 5,
        backgroundColor: Color(0xFF111827),
        automaticallyImplyLeading: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Icon(Icons.arrow_back, color: Colors.purple),
                SizedBox(width: 10),
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
                      "${savedBooks.length} books in your collection",
                      style: TextStyle(color: Colors.white54, fontSize: 13),
                    ),
                  ],
                ),
              ],
            ),

            CustomFormField(
              label: "",
              controller: _searchController,
              hint: "Search Book Is Saved",
              suffixIcon: Icon(Icons.search),
            ),
          ],
        ),
      ),

      //body
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: savedBooks.isEmpty
            ? Center(
                child: Text(
                  "No saved books yet",
                  style: TextStyle(color: Colors.white54, fontSize: 16),
                ),
              )
            : ListView.builder(
                itemCount: savedBooks.length,
                itemBuilder: (context, index) {
                  final buku = savedBooks[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1F32),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'images/Gambar_1.jpg',
                              width: 80,
                              height: 150,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  buku.name,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  buku.category,
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Chip(
                                    label: Text(
                                      buku.category,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),
                                    ),
                                    backgroundColor: const Color(0xFF151a2b),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.star, color: Colors.yellow, size: 15),
                                    SizedBox(width: 4),
                                    Text(
                                      "${buku.rating}",
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
                                      "${buku.pages}p",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Saved",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 20,
                                      ),
                                    ),
                                    Expanded(child: Container(width: double.infinity)),
                                    IconButton(
                                      icon: Icon(Icons.delete, color: Colors.grey),
                                      onPressed: () {
                                        _deleteBuku(index);
                                      },
                                    ),

                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
        
      ),
    );
  }

  void _deleteBuku(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF1A1F32),
        title: Text(
          "Delete Book?",
          style: TextStyle(color: Colors.white),
        ),
        content: Text(
          "Are you sure you want to remove '${savedBooks[index].name}' from your saved books?",
          style: TextStyle(color: Colors.white70),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel", style: TextStyle(color: Colors.grey)),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                savedBooks[index].isSaved = false;
                savedBooks.removeAt(index);
              });
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Book removed from saved"),
                  backgroundColor: Colors.redAccent,
                  duration: Duration(seconds: 2),
                ),
              );
            },
            child: Text(
              "Delete", style: TextStyle(color: Colors.red)
              ),
          ),
        ],
      ),
    );
  }
}