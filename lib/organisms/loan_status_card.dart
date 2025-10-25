import 'package:flutter/material.dart';
import '../molecules/status_badge.dart';

class LoanStatusCard
    extends StatelessWidget {
  final String bookTitle;
  final String status;
  final String dateInfo;
  final int? lateDays;

  const LoanStatusCard({
    Key? key,
    required this.bookTitle,
    required this.status,
    required this.dateInfo,
    this.lateDays,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding:
            const EdgeInsets.all(16),
        child: Row(
          children: [
            // Book Cover
            Container(
              width: 60,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius:
                    BorderRadius
                        .circular(8),
                image:
                    const DecorationImage(
                  image: AssetImage(
                      'assets/images/tech.jpeg'), // Default image
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 16),

            // Book Info
            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment
                        .start,
                children: [
                  Text(
                    bookTitle,
                    style:
                        const TextStyle(
                      fontWeight:
                          FontWeight
                              .bold,
                      fontSize: 16,
                    ),
                    maxLines: 2,
                    overflow:
                        TextOverflow
                            .ellipsis,
                  ),
                  const SizedBox(
                      height: 8),

                  // Status Badge
                  StatusBadge(
                      status: status,
                      lateDays:
                          lateDays),
                  const SizedBox(
                      height: 4),

                  // Date Info
                  Text(
                    dateInfo,
                    style: TextStyle(
                      color: status ==
                              'Terlambat'
                          ? Colors.red
                          : Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),

            // Action Icon
            if (status == 'Dipinjam')
              IconButton(
                icon: const Icon(
                    Icons
                        .arrow_forward_ios,
                    size: 16),
                onPressed: () {
                  // Navigate to book detail or extend loan
                },
              ),
          ],
        ),
      ),
    );
  }
}
