import 'package:flutter/material.dart';
import 'pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:
          'Perpustakaan Digital DINUS',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity
            .adaptivePlatformDensity,
      ),
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
