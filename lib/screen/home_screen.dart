import 'package:flutter/material.dart';
import 'package:projectuas/model/buku.dart';
import 'package:projectuas/screen/detail_screen.dart';
import 'package:projectuas/screen/ui/button.dart';
import 'package:projectuas/screen/ui/custom_form_field.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:projectuas/helper/database_helper.dart';
import 'package:projectuas/data/buku_data.dart'; // Untuk fallback

enum SortType { oldest, latest, highestRating }

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  SortType _sortType = SortType.oldest;

  final TextEditingController _searchController = TextEditingController();

  List<Buku> _filteredBooks = [];
  List<Buku> _bukuList = [];
  List<String> _uniqueCategories = [];
  List<String> _categories = ["All"];
  final DatabaseHelper _dbHelper = DatabaseHelper();
  String category = "";
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_filterBook);
    _loadDataBuku();
  }

  Future<void> _loadDataBuku() async {
    setState(() {
      _isLoading = true;
    });

    try {
      // Data Desktop
      if (kIsWeb) {
        setState(() {
          _bukuList = bukuList;
          _filteredBooks = _bukuList;
          _uniqueCategories = bukuList
              .map((buku) => buku.category)
              .toSet()
              .toList();
          _categories.addAll(_uniqueCategories);
          _isLoading = false;
        });
        return;
      }
      // Data Mobile
      final bukuListFromDb = await _dbHelper.getAllBuku();
      if (bukuListFromDb.isEmpty) {
        await _dbHelper.insertBukuList(bukuList);
        final loadedDb = await _dbHelper.getAllBuku();
        setState(() {
          _bukuList = loadedDb;
          _filteredBooks = _bukuList;
          _uniqueCategories = loadedDb
              .map((buku) => buku.category)
              .toSet()
              .toList();
          _categories.addAll(_uniqueCategories);
          _isLoading = false;
        });
      } else {
        setState(() {
          _bukuList = bukuListFromDb;
          _filteredBooks = _bukuList;
          _uniqueCategories = bukuListFromDb
              .map((buku) => buku.category)
              .toSet()
              .toList();
          _categories.addAll(_uniqueCategories);
          _isLoading = false;
        });
      }
    } catch (e) {
      print('Error loading data from database: $e');
      setState(() {
        _bukuList = bukuList;
        _filteredBooks = _bukuList;
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  void _filterBook() {
    // Filter Search
    final query = _searchController.text.toLowerCase();

    List<Buku> result = _bukuList.where((book) {
      final matchesName = book.name.toLowerCase().contains(query);
      final matchesCategory =
          category.isEmpty ||
          book.category.toLowerCase() == category.toLowerCase();

      return matchesName && matchesCategory;
    }).toList();

    // Sorting
    if (_sortType == SortType.latest) {
      result.sort((a, b) => b.id!.compareTo(a.id!));
    } else if (_sortType == SortType.highestRating) {
      result.sort((a, b) => b.rating.compareTo(a.rating));
    } else if (_sortType == SortType.oldest) {
      result.sort((a, b) => a.id!.compareTo(b.id!));
    }

    setState(() {
      _filteredBooks = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF111827),
        automaticallyImplyLeading: false,
        toolbarHeight: MediaQuery.sizeOf(context).height / 5,
        title: Container(
          alignment: AlignmentDirectional.topStart,
          width: MediaQuery.sizeOf(context).width,
          child: Column(
            children: [
              Align(
                alignment: AlignmentDirectional.topStart,
                child: Text(
                  "Library",
                  style: TextStyle(color: Color(0xFFD1D5DB), fontSize: 18),
                ),
              ),
              Align(
                alignment: AlignmentDirectional.topStart,
                child: Text(
                  "Explore our collection",
                  style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 14),
                ),
              ),
              CustomFormField(
                label: "",
                controller: _searchController,
                hint: "Book",
                suffixIcon: Icon(Icons.search),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Color(0xFF030712),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xFF111827),
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 6,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<SortType>(
                              value: _sortType,
                              dropdownColor: Color(0xFF111827),
                              icon: Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.white,
                              ),
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                              onChanged: (value) {
                                if (value == null) return;
                                setState(() {
                                  _sortType = value;
                                  _filterBook();
                                });
                              },
                              items: [
                                DropdownMenuItem(
                                  value: SortType.oldest,
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.history,
                                        color: Colors.white70,
                                        size: 18,
                                      ),
                                      SizedBox(width: 8),
                                      Text("Oldest"),
                                    ],
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: SortType.latest,
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.fiber_new,
                                        color: Colors.white70,
                                        size: 18,
                                      ),
                                      SizedBox(width: 8),
                                      Text("Latest"),
                                    ],
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: SortType.highestRating,
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellowAccent,
                                        size: 18,
                                      ),
                                      SizedBox(width: 8),
                                      Text("Highest Rating"),
                                    ],
                                  ),
                                ),
                              ],
                              selectedItemBuilder: (context) => [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.history,
                                      color: Colors.white70,
                                      size: 18,
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      "Oldest",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.fiber_new,
                                      color: Colors.white70,
                                      size: 18,
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      "Latest",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellowAccent,
                                      size: 18,
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      "Highest Rating",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ],
                              itemHeight: 48,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),

                    SizedBox(
                      height: 50,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: _categories.length,
                        itemBuilder: (context, index) {
                          bool isActive = _selectedIndex == index;
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFF374151)),
                                gradient: LinearGradient(
                                  colors: isActive
                                      ? [Color(0xFF9333EA), Color(0xFF2563EB)]
                                      : [Color(0xFF1F2937), Color(0xFF1F2937)],
                                ),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  foregroundColor: Color(0xFFD1D5DB),
                                ),
                                onPressed: () {
                                  setState(() {
                                    _selectedIndex = index;
                                    category =
                                        _categories[_selectedIndex] == "All"
                                        ? ""
                                        : _categories[_selectedIndex];
                                    _filterBook();
                                  });
                                },
                                child: Text(
                                  _categories[index],
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 500,
                      child: ListView.builder(
                        itemCount: _filteredBooks.length,
                        itemBuilder: (context, index) {
                          final book = _filteredBooks[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DetailScreen(buku: book),
                                ),
                              );
                            },
                            child: Card(
                              elevation: 1,
                              margin: EdgeInsets.all(8),
                              color: Color(0xFF111827),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  spacing: 15,
                                  children: [
                                    Stack(
                                      children: [
                                        ClipRRect(
                                          child: Image.network(
                                            book.imageUrl,
                                            fit: BoxFit.cover,
                                            width: 100,
                                            height: 180,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Expanded(
                                      child: Column(
                                        spacing: 7,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            book.name,
                                            style: TextStyle(
                                              color: Colors.yellow,
                                            ),
                                          ),
                                          Text(
                                            book.writer,
                                            style: TextStyle(
                                              color: Color(0xFF6B7280),
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              border: Border.all(
                                                color: Color(0xFF374151),
                                              ),
                                              color: Color(0xFF1f2937),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(
                                                4.0,
                                              ),
                                              child: Text(
                                                book.category,
                                                style: TextStyle(
                                                  color: Color(0xFFc084fc),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.star,
                                                    color: Colors.yellow,
                                                  ),
                                                  SizedBox(width: 6),
                                                  Text(
                                                    book.rating.toString(),
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(width: 6),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.menu_book,
                                                    color: Color(0xFF6B7280),
                                                  ),
                                                  SizedBox(width: 6),
                                                  Text(
                                                    "${book.pages} pages",
                                                    style: TextStyle(
                                                      color: Color(0xFF6B7280),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Row(
                                            spacing:
                                                MediaQuery.sizeOf(
                                                      context,
                                                    ).width >
                                                    320
                                                ? 60
                                                : 0,
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),

                                                  color: Color(0xFF052e16),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                    8.0,
                                                  ),
                                                  child: Text(
                                                    book.availability
                                                        ? "Available"
                                                        : "Unavailable",
                                                    style: TextStyle(
                                                      color: book.availability
                                                          ? Color(0xFF4ade80)
                                                          : Color(0xFFf87171),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              book.isSaved
                                                  ? Button(
                                                      onPressed: () async {
                                                        if (book.id != null) {
                                                          await _dbHelper
                                                              .toggleFavorite(
                                                                book.id!,
                                                                !book.isSaved,
                                                              );
                                                          setState(() {
                                                            book.isSaved =
                                                                !book.isSaved;
                                                          });
                                                        }
                                                      },
                                                      icon:
                                                          Icons.bookmark_added,
                                                      title: "",
                                                    )
                                                  : Button(
                                                      onPressed: () async {
                                                        if (book.id != null) {
                                                          await _dbHelper
                                                              .toggleFavorite(
                                                                book.id!,
                                                                !book.isSaved,
                                                              );
                                                          setState(() {
                                                            book.isSaved =
                                                                !book.isSaved;
                                                          });
                                                        }
                                                      },
                                                      icon: Icons
                                                          .bookmark_add_outlined,
                                                      title: "",
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
                  ],
                ),
              ),
            ),
    );
  }
}
