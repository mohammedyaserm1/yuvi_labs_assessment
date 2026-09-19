import 'package:flutter/material.dart';

void main() {
  runApp(const CalorieApp());
}

class CalorieApp extends StatelessWidget {
  const CalorieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const DesktopPreview(),
    );
  }
}

class DesktopPreview extends StatelessWidget {
  const DesktopPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDEFF0),
      body: Center(
        child: Container(
          width: 352,
          height: 755,
          decoration: BoxDecoration(
            color: const Color(0xFFF7F7F7),
            borderRadius: BorderRadius.circular(42),
            border: Border.all(
              color: Colors.white,
              width: 4,
            ),
          ),
          clipBehavior: Clip.hardEdge,
          child: const HomeScreen(),
        ),
      ),
    );
  }
}
