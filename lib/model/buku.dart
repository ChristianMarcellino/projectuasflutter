class Buku {
  final int? id;
  final String name;
  final String category;
  final String description;
  final String writer;
  bool availability;
  final double rating;
  final int pages;
  final String imageUrl;
  bool isSaved;

  Buku({
    this.id,
    required this.name,
    required this.writer,
    required this.category,
    required this.description,
    required this.availability,
    required this.imageUrl,
    required this.isSaved,
    required this.pages,
    required this.rating,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      "writer" : writer,
      'category': category,
      'description': description,
      'availability': availability ? 1 : 0,
      'imageUrl': imageUrl,
      'isSaved': isSaved ? 1 : 0,
      "pages": pages,
      "rating": rating,
    };
  }

  factory Buku.fromMap(Map<String, dynamic> map) {
    return Buku(
      id: map['id'],
      name: map['name'],
      writer : map['writer'],
      category: map['category'],
      description: map['description'],
      availability: map['availability'] == 1,
      isSaved: map['isSaved'] == 1,
      imageUrl: map['imageUrl'],
      pages: map["pages"],
      rating: map["rating"],
    );
  }
}
