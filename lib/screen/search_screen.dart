import 'package:flutter/material.dart';
import 'package:projectuas/screen/ui/custom_form_field.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<String> _filteredBooks = [];
  String searchQuery = "";
  final TextEditingController _searchController = TextEditingController();
  final List<String> _items = [
    'Item 1sssssssssssssssssssssssss1sssssssssssssssssssssssss',
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
      appBar: AppBar(title: Text("Wawan")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              CustomFormField(
                label: "",
                controller: _searchController,
                hint: "Book",
                suffixIcon: Icon(Icons.search),
              ),
              SizedBox(
                height: 500,
                child: ListView.builder(
                  itemCount: _items.length,
                  itemBuilder: (context, index) {
                    final book = _items[index];
                    return Card(
                      margin: EdgeInsets.all(8),
                      color: Color(0xFF111827),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            spacing: 20,
                            children: [
                              ClipRRect(
                                child: Image.network(
                                  "https://picsum.photos/id/237/200/300",
                                  fit: BoxFit.cover,
                                  width: 40,
                                  height: 80,
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      "anggep buku",
                                      style: TextStyle(color: Colors.yellow),
                                    ),
                                    Text(
                                      _items[index],
                                      style: TextStyle(color: Colors.yellow),
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
