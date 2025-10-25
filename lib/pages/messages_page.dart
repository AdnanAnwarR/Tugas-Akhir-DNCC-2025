import 'package:flutter/material.dart';

class MessagesPage
    extends StatefulWidget {
  const MessagesPage({Key? key})
      : super(key: key);

  @override
  _MessagesPageState createState() =>
      _MessagesPageState();
}

class _MessagesPageState
    extends State<MessagesPage> {
  final List<Map<String, dynamic>>
      _messages = [
    {
      'id': '1',
      'title': 'Peminjaman Berhasil',
      'message':
          'Buku "SQL" berhasil dipinjam. Tanggal pengembalian: 7 April 2025',
      'time': '10:30 AM',
      'isRead': false,
      'type': 'success',
    },
    {
      'id': '2',
      'title': 'Pengingat Pengembalian',
      'message':
          'Buku "Artificial Intelligence" harus dikembalikan dalam 2 hari',
      'time': 'Yesterday',
      'isRead': true,
      'type': 'warning',
    },
    {
      'id': '3',
      'title': 'Buku Tersedia',
      'message':
          'Buku "Arduino" yang Anda tunggu sudah tersedia',
      'time': '2 days ago',
      'isRead': true,
      'type': 'info',
    },
    {
      'id': '4',
      'title': 'Peminjaman Ditolak',
      'message':
          'Peminjaman buku "Data Science" ditolak karena stok habis',
      'time': '1 week ago',
      'isRead': true,
      'type': 'error',
    },
  ];

  Color _getMessageColor(String type) {
    switch (type) {
      case 'success':
        return Colors.green;
      case 'warning':
        return Colors.orange;
      case 'error':
        return Colors.red;
      default:
        return Colors.blue;
    }
  }

  IconData _getMessageIcon(
      String type) {
    switch (type) {
      case 'success':
        return Icons.check_circle;
      case 'warning':
        return Icons.warning;
      case 'error':
        return Icons.error;
      default:
        return Icons.info;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pesan'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(
                Icons.delete_outline),
            onPressed: () {
              // Clear all messages
            },
          ),
        ],
      ),
      body: _messages.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment
                        .center,
                children: [
                  Icon(Icons.message,
                      size: 64,
                      color:
                          Colors.grey),
                  SizedBox(height: 16),
                  Text(
                    'Tidak ada pesan',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors
                            .grey),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount:
                  _messages.length,
              itemBuilder:
                  (context, index) {
                final message =
                    _messages[index];
                return Card(
                  margin:
                      const EdgeInsets
                          .symmetric(
                          horizontal:
                              16,
                          vertical: 4),
                  child: ListTile(
                    leading: Icon(
                      _getMessageIcon(
                          message[
                              'type']),
                      color: _getMessageColor(
                          message[
                              'type']),
                    ),
                    title: Text(
                      message['title'],
                      style: TextStyle(
                        fontWeight: message[
                                'isRead']
                            ? FontWeight
                                .normal
                            : FontWeight
                                .bold,
                      ),
                    ),
                    subtitle: Text(
                        message[
                            'message']),
                    trailing: Column(
                      mainAxisAlignment:
                          MainAxisAlignment
                              .center,
                      children: [
                        Text(
                          message[
                              'time'],
                          style: const TextStyle(
                              fontSize:
                                  12,
                              color: Colors
                                  .grey),
                        ),
                        if (!message[
                            'isRead'])
                          Container(
                            margin: const EdgeInsets
                                .only(
                                top: 4),
                            width: 8,
                            height: 8,
                            decoration:
                                const BoxDecoration(
                              color: Colors
                                  .red,
                              shape: BoxShape
                                  .circle,
                            ),
                          ),
                      ],
                    ),
                    onTap: () {
                      setState(() {
                        message['isRead'] =
                            true;
                      });
                      // Show message details
                    },
                  ),
                );
              },
            ),
    );
  }
}
