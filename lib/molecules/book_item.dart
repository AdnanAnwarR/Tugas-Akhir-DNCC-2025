import 'package:flutter/material.dart';
import '../atoms/book_card.dart';

class BookItem extends StatelessWidget {
  final String title;
  final String
      imageAsset; // Changed from imageUrl
  final String status;
  final String? returnDate;
  final VoidCallback onTap;

  const BookItem({
    Key? key,
    required this.title,
    required this.imageAsset, // Changed parameter name
    required this.status,
    this.returnDate,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.stretch,
      children: [
        // BookCard dengan tinggi tetap
        SizedBox(
          height: 180,
          child: BookCard(
            title: title,
            imageAsset:
                imageAsset, // Updated parameter
            onTap: onTap,
          ),
        ),

        const SizedBox(height: 4),

        // Status
        Text(
          status,
          style: TextStyle(
            color: status == 'Tersedia'
                ? Colors.green
                : Colors.orange,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),

        // Return date jika ada
        if (returnDate != null)
          Padding(
            padding:
                const EdgeInsets.only(
                    top: 2),
            child: Text(
              'Tanggal Kembali:\n$returnDate',
              style: const TextStyle(
                  fontSize: 10,
                  color: Colors.grey),
              textAlign:
                  TextAlign.center,
              maxLines: 2,
            ),
          ),
      ],
    );
  }
}
