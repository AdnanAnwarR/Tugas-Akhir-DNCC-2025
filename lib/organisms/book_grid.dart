import 'package:flutter/material.dart';
import '../molecules/book_item.dart';

class BookGrid extends StatelessWidget {
  final List<Map<String, dynamic>>
      books;
  final Function(String) onBookTap;

  const BookGrid({
    Key? key,
    required this.books,
    required this.onBookTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 0.65,
      ),
      itemCount: books.length,
      itemBuilder: (context, index) {
        final book = books[index];
        return BookItem(
          title: book['title'],
          imageAsset: book[
              'imageAsset'], // Updated parameter name
          status: book['status'],
          returnDate:
              book['returnDate'],
          onTap: () =>
              onBookTap(book['id']),
        );
      },
    );
  }
}
