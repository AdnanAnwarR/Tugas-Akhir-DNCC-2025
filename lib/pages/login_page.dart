import 'package:flutter/material.dart';
import '../atoms/custom_button.dart';
import '../atoms/custom_textfield.dart';
import 'home_page.dart';

class LoginPage
    extends StatelessWidget {
  final TextEditingController
      nimController =
      TextEditingController();
  final TextEditingController
      passwordController =
      TextEditingController();

  LoginPage({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center,
          children: [
            const Column(
              children: [
                Text(
                  'PERPUSTAKAAN',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),
                Text(
                  'DIGITAL',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight:
                        FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Belajar Tanpa Batas, Akses Buku Kapan Saja',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                  textAlign:
                      TextAlign.center,
                ),
                SizedBox(height: 40),
              ],
            ),
            // Form
            CustomTextField(
              label:
                  'Nomor Induk Mahasiswa',
              controller: nimController,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              label: 'Password',
              controller:
                  passwordController,
              isPassword: true,
            ),
            const SizedBox(height: 16),
            // Remember me & Forgot password
            Row(
              mainAxisAlignment:
                  MainAxisAlignment
                      .spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: false,
                      onChanged:
                          (value) {},
                    ),
                    const Text(
                        'Ingat Saya'),
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                      'Lupa Kata Sandi'),
                ),
              ],
            ),
            const SizedBox(height: 24),
            // Login button
            CustomButton(
              text: 'Masuk',
              onPressed: () {
                Navigator
                    .pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const HomePage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
