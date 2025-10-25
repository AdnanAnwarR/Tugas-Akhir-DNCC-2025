import 'package:flutter/material.dart';

class StatusBadge
    extends StatelessWidget {
  final String status;
  final int? lateDays;

  const StatusBadge({
    Key? key,
    required this.status,
    this.lateDays,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    String text;

    switch (status) {
      case 'Dipinjam':
        backgroundColor = Colors.orange;
        text = 'Dipinjam';
        break;
      case 'Dikembalikan':
        backgroundColor = Colors.green;
        text = 'Dikembalikan';
        break;
      case 'Terlambat':
        backgroundColor = Colors.red;
        text = 'Terlambat';
        break;
      default:
        backgroundColor = Colors.grey;
        text = status;
    }

    if (lateDays != null &&
        status == 'Terlambat') {
      text = '$lateDays Hari Terlambat';
    }

    return Container(
      padding:
          const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 6),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius:
            BorderRadius.circular(4),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
