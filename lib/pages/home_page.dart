import 'package:flutter/material.dart';
import '../organisms/header_profile.dart';
import '../organisms/book_grid.dart';
import '../molecules/category_chip.dart';
import '../atoms/bottom_nav_bar.dart';
import 'book_detail_page.dart';
import 'search_page.dart';
import 'messages_page.dart';
import 'profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key})
      : super(key: key);

  @override
  _HomePageState createState() =>
      _HomePageState();
}

class _HomePageState
    extends State<HomePage> {
  int _currentIndex = 0;

  // List of pages for bottom navigation
  final List<Widget> _pages = [
    const HomeContent(), // Home content
    const SearchPage(),
    const MessagesPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _currentIndex == 0
          ? AppBar(
              title: const Text(
                  'Perpustakaan Digital'),
              backgroundColor:
                  Colors.blue,
              foregroundColor:
                  Colors.white,
            )
          : null,
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

// Home Content (dipisah dari navigation logic)
class HomeContent
    extends StatefulWidget {
  const HomeContent({Key? key})
      : super(key: key);

  @override
  _HomeContentState createState() =>
      _HomeContentState();
}

class _HomeContentState
    extends State<HomeContent> {
  String _selectedCategory = 'Semua';

  final List<Map<String, dynamic>>
      _books = [
    {
      'id': '1',
      'title': 'SQL',
      'imageAsset':
          'assets/images/sql.jpeg',
      'status': 'Dipinjam',
      'returnDate':
          'Senin, 7 April 2025',
    },
    {
      'id': '2',
      'title': 'MEROCURMAN MartelDB',
      'imageAsset':
          'assets/images/tech.jpeg',
      'status': 'Tersedia',
      'returnDate': null,
    },
    {
      'id': '3',
      'title': 'SUKU 10',
      'imageAsset':
          'assets/images/business.jpeg',
      'status': 'Dipinjam',
      'returnDate':
          'Senin, 7 April 2025',
    },
    {
      'id': '4',
      'title': 'Programan WEB',
      'imageAsset':
          'assets/images/tech.jpeg',
      'status': 'Tersedia',
      'returnDate': null,
    },
  ];

  final List<String> _categories = [
    'Semua',
    'Teknologi',
    'Bisnis',
    'Sastra',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          // Header Profile
          HeaderProfile(
            name: 'ADNAN ANWAR RABBANI',
            location:
                'Semarang, Indonesia',
          ),
          const SizedBox(height: 20),

          // Search Bar
          Container(
            height: 50,
            child: TextField(
              decoration:
                  InputDecoration(
                hintText:
                    'Cari buku...',
                prefixIcon: const Icon(
                    Icons.search),
                border:
                    OutlineInputBorder(
                  borderRadius:
                      BorderRadius
                          .circular(8),
                ),
              ),
              onTap: () {
                // Navigate to search page
              },
            ),
          ),

          const SizedBox(height: 20),

          // Recommended Books Section
          Row(
            mainAxisAlignment:
                MainAxisAlignment
                    .spaceBetween,
            children: [
              const Text(
                'Rekomendasi Buku',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight:
                      FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                    'Lihat semua'),
              ),
            ],
          ),

          const SizedBox(height: 10),

          // Categories
          SizedBox(
            height: 40,
            child:
                SingleChildScrollView(
              scrollDirection:
                  Axis.horizontal,
              child: Row(
                children: _categories
                    .map((category) {
                  return Padding(
                    padding:
                        const EdgeInsets
                            .only(
                            right: 8),
                    child: CategoryChip(
                      label: category,
                      isSelected:
                          _selectedCategory ==
                              category,
                      onTap: () {
                        setState(() {
                          _selectedCategory =
                              category;
                        });
                      },
                    ),
                  );
                }).toList(),
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Books Grid
          SizedBox(
            height: 400,
            child: BookGrid(
              books: _books,
              onBookTap: (bookId) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        BookDetailPage(
                            bookId:
                                bookId),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
