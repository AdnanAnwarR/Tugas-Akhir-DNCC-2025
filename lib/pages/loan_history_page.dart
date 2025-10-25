import 'package:flutter/material.dart';
import '../organisms/loan_status_card.dart';

class LoanHistoryPage
    extends StatefulWidget {
  const LoanHistoryPage({Key? key})
      : super(key: key);

  @override
  _LoanHistoryPageState createState() =>
      _LoanHistoryPageState();
}

class _LoanHistoryPageState
    extends State<LoanHistoryPage> {
  String _selectedFilter = 'Semua';

  final List<Map<String, dynamic>>
      _loanHistory = [
    {
      'id': '1',
      'title': 'SQL',
      'status': 'Dipinjam',
      'dateInfo':
          'Hingga: 5 April 2025',
      'lateDays': null,
    },
    {
      'id': '2',
      'title': 'Programan WEB',
      'status': 'Dikembalikan',
      'dateInfo': '3 April 2025',
      'lateDays': null,
    },
    {
      'id': '3',
      'title':
          'Artificial Intelligence',
      'status': 'Terlambat',
      'dateInfo': '2 Hari Terlambat',
      'lateDays': 2,
    },
    {
      'id': '4',
      'title': 'Data Structure',
      'status': 'Dikembalikan',
      'dateInfo': '1 April 2025',
      'lateDays': null,
    },
    {
      'id': '5',
      'title': 'Machine Learning',
      'status': 'Dipinjam',
      'dateInfo':
          'Hingga: 12 April 2025',
      'lateDays': null,
    },
  ];

  List<Map<String, dynamic>>
      get _filteredLoans {
    if (_selectedFilter == 'Semua') {
      return _loanHistory;
    } else {
      return _loanHistory
          .where((loan) =>
              loan['status'] ==
              _selectedFilter)
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Riwayat Peminjaman'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
              Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          // Filter Chips
          Container(
            padding:
                const EdgeInsets.all(
                    16),
            child:
                SingleChildScrollView(
              scrollDirection:
                  Axis.horizontal,
              child: Row(
                children: [
                  _buildFilterChip(
                      'Semua'),
                  const SizedBox(
                      width: 8),
                  _buildFilterChip(
                      'Dipinjam'),
                  const SizedBox(
                      width: 8),
                  _buildFilterChip(
                      'Dikembalikan'),
                  const SizedBox(
                      width: 8),
                  _buildFilterChip(
                      'Terlambat'),
                ],
              ),
            ),
          ),

          // Loan List
          Expanded(
            child: _filteredLoans
                    .isEmpty
                ? const Center(
                    child: Column(
                      mainAxisAlignment:
                          MainAxisAlignment
                              .center,
                      children: [
                        Icon(
                            Icons
                                .history,
                            size: 64,
                            color: Colors
                                .grey),
                        SizedBox(
                            height: 16),
                        Text(
                          'Tidak ada riwayat peminjaman',
                          style: TextStyle(
                              fontSize:
                                  16,
                              color: Colors
                                  .grey),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding:
                        const EdgeInsets
                            .all(16),
                    itemCount:
                        _filteredLoans
                            .length,
                    itemBuilder:
                        (context,
                            index) {
                      final loan =
                          _filteredLoans[
                              index];
                      return Padding(
                        padding:
                            const EdgeInsets
                                .only(
                                bottom:
                                    12),
                        child:
                            LoanStatusCard(
                          bookTitle: loan[
                              'title'],
                          status: loan[
                              'status'],
                          dateInfo: loan[
                              'dateInfo'],
                          lateDays: loan[
                              'lateDays'],
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(
      String label) {
    final isSelected =
        _selectedFilter == label;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedFilter = label;
        });
      },
      child: Container(
        padding:
            const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.blue
              : Colors.grey[200],
          borderRadius:
              BorderRadius.circular(20),
          border: isSelected
              ? Border.all(
                  color: Colors.blue,
                  width: 2)
              : null,
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected
                ? Colors.white
                : Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
