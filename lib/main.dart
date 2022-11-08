import 'package:dutch_app/calculate_page/calculate_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: const Color(0xFFFEFEFF),
          appBar: AppBar(
            title: const Text(
              "Dutch app",
              style: TextStyle(color: Color(0xFF627893)),
            ),
            backgroundColor: const Color((0xFFF6F9FC)),
          ),
          body: const CalculatePage()),
    );
  }
}
