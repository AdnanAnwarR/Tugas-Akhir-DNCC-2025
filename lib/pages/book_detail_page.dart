import 'package:flutter/material.dart';
import '../atoms/custom_button.dart';

class BookDetailPage
    extends StatelessWidget {
  final String bookId;

  const BookDetailPage(
      {Key? key, required this.bookId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Determine which image to use based on bookId
    String getImageAsset() {
      switch (bookId) {
        case '1':
          return 'assets/images/sql.jpeg';
        case '2':
        case '4':
          return 'assets/images/tech.jpeg';
        case '3':
          return 'assets/images/business.jpeg';
        default:
          return 'assets/images/tech.jpeg';
      }
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
              Icons.arrow_back),
          onPressed: () =>
              Navigator.pop(context),
        ),
        title:
            const Text('Detail Buku'),
      ),
      body: SingleChildScrollView(
        padding:
            const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            // Book Header
            Row(
              crossAxisAlignment:
                  CrossAxisAlignment
                      .start,
              children: [
                Container(
                  width: 100,
                  height: 150,
                  decoration:
                      BoxDecoration(
                    borderRadius:
                        BorderRadius
                            .circular(
                                8),
                    image:
                        DecorationImage(
                      image: AssetImage(
                          getImageAsset()),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                    width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment
                            .start,
                    children: [
                      const Text(
                        'Arduino',
                        style:
                            TextStyle(
                          fontSize: 24,
                          fontWeight:
                              FontWeight
                                  .bold,
                        ),
                      ),
                      const SizedBox(
                          height: 8),
                      Row(
                        children: List
                            .generate(
                          5,
                          (index) => const Icon(
                              Icons
                                  .star,
                              color: Colors
                                  .amber,
                              size: 20),
                        ),
                      ),
                      const SizedBox(
                          height: 8),
                      Row(
                        children: [
                          const Text(
                              'Teknologi'),
                          const SizedBox(
                              width: 8),
                          Container(
                            padding: const EdgeInsets
                                .symmetric(
                                horizontal:
                                    8,
                                vertical:
                                    4),
                            decoration:
                                BoxDecoration(
                              color: Colors
                                  .green,
                              borderRadius:
                                  BorderRadius.circular(
                                      4),
                            ),
                            child:
                                const Text(
                              'Tersedia',
                              style:
                                  TextStyle(
                                color: Colors
                                    .white,
                                fontSize:
                                    12,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                          height: 8),
                      const Text(
                        'Stok Lokasi:',
                        style: TextStyle(
                            fontWeight:
                                FontWeight
                                    .bold),
                      ),
                      const Text(
                          'Rak B-12'),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            // Synopsis
            const Text(
              'Sinopsis:',
              style: TextStyle(
                fontSize: 18,
                fontWeight:
                    FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Buku ini memberikan pengenalan lengkap tentang Arduino, '
              'sebuah platform mikrokontroler open-source yang popular '
              'di dunia elektronik dan IoT. Pembaca akan dipandu dari '
              'dasar-dasar Arduino, seperti pemrograman dengan '
              'Arduino IDE, penggunaan sensor, aktuator, hingga '
              'pembuatan proyek elektronik sederhana. Dengan bahasa '
              'yang mudah dipahami dan contoh aplikasi nyata, buku ini '
              'cocok untuk pemula maupun mereka yang ingin '
              'mengembangkan keterampilan dalam bidang embedded '
              'system dan robotika.',
              style: TextStyle(
                  fontSize: 14,
                  height: 1.5),
            ),
            const SizedBox(height: 24),
            // Details
            const Text(
              'Detail:',
              style: TextStyle(
                fontSize: 18,
                fontWeight:
                    FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
                'Karya Prof. Dr. Ir. Widodo Budiharto'),
            const Text('Tahun 2020'),
            const SizedBox(height: 32),
            // Borrow Button
            CustomButton(
              text: 'Pinjam Buku',
              onPressed: () {
                // Handle book borrowing
              },
            ),
          ],
        ),
      ),
    );
  }
}
