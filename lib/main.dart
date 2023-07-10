import 'package:al_noor/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AlNoorApp());
}

class AlNoorApp extends StatelessWidget {
  const AlNoorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xFFe9c46a),
        ),
        iconTheme: const IconThemeData(color: Color(0xFFe9c46a)),
        primaryColor: const Color(0xFFe9c46a),
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
