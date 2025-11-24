import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int? _selectedIndex = 0;
  final List<String> _items = [
    'Item 1sssssssssssssssssssssssss',
    'Item 2',
    'Item 3',
    'Item 4',
    "sd",
    "sds",
    'sds',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF111827),
        automaticallyImplyLeading: false,
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
            ],
          ),
        ),
      ),
      backgroundColor: Color(0xFF030712),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 50,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: _items.length,
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
                            });
                          },
                          child: Text(
                            _items[index],
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
                  itemCount: _items.length,
                  itemBuilder: (context, index) {
                    final book = _items[index];
                    return Card(
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
                                    "https://marketplace.canva.com/EAGUhHGuQOg/1/0/1003w/canva-orange-and-blue-anime-cartoon-illustrative-novel-story-book-cover-WZE2VIj5AVQ.jpg",
                                    fit: BoxFit.cover,
                                    width: 100,
                                    height: 180,
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Column(
                                spacing: 3,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Judul Buku",
                                    style: TextStyle(color: Colors.yellow),
                                  ),
                                  Text(
                                    _items[index],
                                    style: TextStyle(color: Color(0xFF6B7280)),
                                  ),
                                  Container(
                                    color: Colors.black,
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text(
                                        "wawan",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    spacing: 5,
                                    children: [
                                      Row(
                                        spacing: 3,
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.yellow,
                                          ),
                                          Text(
                                            "4.8",
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        spacing: 3,
                                        children: [
                                          Icon(
                                            Icons.timer,
                                            color: Color(0xFF6B7280),
                                          ),
                                          Text(
                                            "3222 pages",
                                            style: TextStyle(
                                              color: Color(0xFF6B7280),
                                            ),
                                          ),
                                        ],
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
            ],
          ),
        ),
      ),
    );
  }
}
