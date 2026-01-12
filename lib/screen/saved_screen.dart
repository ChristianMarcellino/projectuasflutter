import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projectuas/helper/database_helper.dart';
import 'package:projectuas/model/buku.dart';
import 'package:projectuas/screen/ui/custom_form_field.dart';
import 'package:projectuas/data/buku_data.dart';
import 'package:projectuas/screen/detail_screen.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() => _SavedScreen();
}

class _SavedScreen extends State<SavedScreen> {
  final TextEditingController _searchController = TextEditingController();

  String searchQuery = "";
  List<Buku> savedBooks = [];
  List<Buku> displayedBooks = [];
  final DatabaseHelper _dbHelper = DatabaseHelper();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_filterSavedBooks);
    _loadSavedBooks();
  }

  Future<void> _loadSavedBooks() async {
    final favs = await _dbHelper.getFavoriteBuku();
    setState(() {
      savedBooks = favs;
      displayedBooks = List.from(savedBooks);
    });
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
            : displayedBooks.isEmpty
                ? Center(
                    child: Text(
                      "No books match your search",
                      style: TextStyle(color: Colors.white54, fontSize: 16),
                    ),
                  )
                : RefreshIndicator(
                    onRefresh: _loadSavedBooks,
                    child: ListView.builder(
                      physics: AlwaysScrollableScrollPhysics(),
                      itemCount: displayedBooks.length,
                      itemBuilder: (context, index) {
                        final buku = displayedBooks[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(14),
                            onTap: () {
                              Navigator.push(
                                context, 
                                MaterialPageRoute(
                                  builder: (context) => DetailScreen(buku: buku),
                                ),
                              );
                            },
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
                                  child: Image.network(
                                    buku.imageUrl,
                                    width: 80,
                                    height: 150,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) => Container(
                                      width: 80,
                                      height: 150,
                                      color: Colors.grey[800],
                                      child: Icon(Icons.broken_image, color: Colors.white54),
                                    ),
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
                          ),
                        );
                      },
              ),
        
      ),
    ), 
  
  );  
}

  void _filterSavedBooks() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        displayedBooks = List.from(savedBooks);
      } else {
        final tokens = query.split(RegExp(r'\s+')).where((t) => t.isNotEmpty).toList();
        displayedBooks = savedBooks.where((buku) {
          final nameWords = buku.name.toLowerCase().split(RegExp(r'\s+'));
          return tokens.every((token) => nameWords.any((word) => word.startsWith(token)));
        }).toList();
      }
    });
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterSavedBooks);
    _searchController.dispose();
    super.dispose();
  }

  void _deleteBuku(int index) {
    final bukuToDelete = displayedBooks[index];
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF1A1F32),
        title: Text(
          "Delete Book?",
          style: TextStyle(color: Colors.white),
        ),
        content: Text(
          "Are you sure you want to remove '${bukuToDelete.name}' from your saved books?",
          style: TextStyle(color: Colors.white70),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel", style: TextStyle(color: Colors.grey)),
          ),
          TextButton(
            onPressed: () async {
              // Persist change in database
              if (bukuToDelete.id != null) {
                await _dbHelper.toggleFavorite(bukuToDelete.id!, true);
              }

              setState(() {
                bukuToDelete.isSaved = false;
                savedBooks.removeWhere((b) => b.id == bukuToDelete.id);
                displayedBooks.removeAt(index);
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