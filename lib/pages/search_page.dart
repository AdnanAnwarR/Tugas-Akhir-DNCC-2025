import 'package:flutter/material.dart';
import '../organisms/book_grid.dart';
import '../molecules/category_chip.dart';

class SearchPage
    extends StatefulWidget {
  const SearchPage({Key? key})
      : super(key: key);

  @override
  _SearchPageState createState() =>
      _SearchPageState();
}

class _SearchPageState
    extends State<SearchPage> {
  String _selectedFilter = 'Semua';
  String _searchQuery = '';

  final List<Map<String, dynamic>>
      _allBooks = [
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
    {
      'id': '5',
      'title': 'Arduino',
      'imageAsset':
          'assets/images/tech.jpeg',
      'status': 'Tersedia',
      'returnDate': null,
    },
    {
      'id': '6',
      'title':
          'Artificial Intelligence',
      'imageAsset':
          'assets/images/tech.jpeg',
      'status': 'Dipinjam',
      'returnDate': '10 April 2025',
    },
  ];

  final List<String> _filters = [
    'Semua',
    'Tersedia',
    'Dipinjam'
  ];

  List<Map<String, dynamic>>
      get _filteredBooks {
    List<Map<String, dynamic>>
        filtered = _allBooks;

    // Filter berdasarkan status
    if (_selectedFilter != 'Semua') {
      filtered = filtered
          .where((book) =>
              book['status'] ==
              _selectedFilter)
          .toList();
    }

    // Filter berdasarkan pencarian
    if (_searchQuery.isNotEmpty) {
      filtered = filtered
          .where((book) => book['title']
              .toLowerCase()
              .contains(_searchQuery
                  .toLowerCase()))
          .toList();
    }

    return filtered;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cari Buku'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding:
            const EdgeInsets.all(16),
        child: Column(
          children: [
            // Search Bar
            TextField(
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
                filled: true,
                fillColor:
                    Colors.grey[100],
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
            ),
            const SizedBox(height: 16),

            // Filter Chips
            SizedBox(
              height: 40,
              child: Row(
                children: [
                  const Text(
                    'Filter:',
                    style: TextStyle(
                        fontWeight:
                            FontWeight
                                .bold),
                  ),
                  const SizedBox(
                      width: 8),
                  Expanded(
                    child: ListView(
                      scrollDirection:
                          Axis.horizontal,
                      children: _filters
                          .map(
                              (filter) {
                        return Padding(
                          padding:
                              const EdgeInsets
                                  .only(
                                  right:
                                      8),
                          child:
                              CategoryChip(
                            label:
                                filter,
                            isSelected:
                                _selectedFilter ==
                                    filter,
                            onTap: () {
                              setState(
                                  () {
                                _selectedFilter =
                                    filter;
                              });
                            },
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Results
            Expanded(
              child:
                  _filteredBooks.isEmpty
                      ? const Center(
                          child: Text(
                            'Tidak ada buku yang ditemukan',
                            style: TextStyle(
                                fontSize:
                                    16,
                                color: Colors
                                    .grey),
                          ),
                        )
                      : BookGrid(
                          books:
                              _filteredBooks,
                          onBookTap:
                              (bookId) {
                            // Navigate to book detail
                          },
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
