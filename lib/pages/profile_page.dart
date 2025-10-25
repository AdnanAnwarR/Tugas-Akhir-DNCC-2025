import 'package:flutter/material.dart';
import 'loan_history_page.dart';
import 'login_page.dart';

class ProfilePage
    extends StatefulWidget {
  const ProfilePage({Key? key})
      : super(key: key);

  @override
  _ProfilePageState createState() =>
      _ProfilePageState();
}

class _ProfilePageState
    extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(
                Icons.settings),
            onPressed: () {
              // Navigate to settings
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding:
            const EdgeInsets.all(16),
        child: Column(
          children: [
            // Profile Picture
            Stack(
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundColor:
                      Colors.grey,
                  child: Icon(
                      Icons.person,
                      size: 60,
                      color:
                          Colors.white),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    padding:
                        const EdgeInsets
                            .all(4),
                    decoration:
                        const BoxDecoration(
                      color:
                          Colors.blue,
                      shape: BoxShape
                          .circle,
                    ),
                    child: const Icon(
                        Icons
                            .camera_alt,
                        size: 20,
                        color: Colors
                            .white),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Text(
              'Ubah Gambar',
              style: TextStyle(
                  color: Colors.blue),
            ),
            const SizedBox(height: 24),

            // Profile Information
            _buildProfileField('Nama:',
                'ADNAN ANWAR RABBANI'),
            _buildProfileField(
                'Nomor Induk Mahasiswa:',
                'A11.2024.15540'),
            _buildProfileField(
                'Fakultas:',
                'Fakultas Ilmu Komputer'),
            _buildProfileField(
                'Progdi:',
                'Teknik Informatika'),
            const SizedBox(height: 32),

            // Statistics
            Row(
              mainAxisAlignment:
                  MainAxisAlignment
                      .spaceAround,
              children: [
                _buildStatCard('5',
                    'Total Dipinjam'),
                _buildStatCard('3',
                    'Sedang Dipinjam'),
                _buildStatCard(
                    '1', 'Terlambat'),
              ],
            ),
            const SizedBox(height: 24),

            // Menu Options
            _buildMenuOption(
              icon: Icons.history,
              title:
                  'Riwayat Peminjaman',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const LoanHistoryPage()),
                );
              },
            ),
            _buildMenuOption(
              icon:
                  Icons.favorite_border,
              title: 'Buku Favorit',
              onTap: () {
                // Navigate to favorites
              },
            ),
            _buildMenuOption(
              icon: Icons
                  .notifications_none,
              title: 'Notifikasi',
              onTap: () {
                // Navigate to notifications
              },
            ),
            _buildMenuOption(
              icon: Icons.help_outline,
              title: 'Bantuan',
              onTap: () {
                // Navigate to help
              },
            ),
            _buildMenuOption(
              icon: Icons.logout,
              title: 'Keluar',
              onTap: () {
                _showLogoutDialog(
                    context);
              },
              isLogout: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileField(
      String label, String value) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(
              vertical: 8),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight:
                  FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
                fontSize: 16),
          ),
          const Divider(height: 20),
        ],
      ),
    );
  }

  Widget _buildStatCard(
      String number, String label) {
    return Column(
      children: [
        Text(
          number,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildMenuOption({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool isLogout = false,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: isLogout
            ? Colors.red
            : Colors.blue,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: isLogout
              ? Colors.red
              : Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 16),
      onTap: onTap,
    );
  }

  void _showLogoutDialog(
      BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Keluar'),
          content: const Text(
              'Apakah Anda yakin ingin keluar?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pop();
              },
              child:
                  const Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pop();
                // Logout logic here
                Navigator
                    .pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          LoginPage()),
                );
              },
              child: const Text(
                'Keluar',
                style: TextStyle(
                    color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }
}
