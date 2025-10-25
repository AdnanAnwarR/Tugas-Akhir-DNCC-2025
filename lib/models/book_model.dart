class Book {
  final String id;
  final String title;
  final String author;
  final String category;
  final double rating;
  final String status;
  final String location;
  final String synopsis;
  final int year;
  final String imageUrl;
  final DateTime? returnDate;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.category,
    required this.rating,
    required this.status,
    required this.location,
    required this.synopsis,
    required this.year,
    required this.imageUrl,
    this.returnDate,
  });
}
