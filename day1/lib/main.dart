import 'package:flutter/material.dart';

import 'widgets/mobile_frame.dart';

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
      body: const Center(child: MobileFrame()),
    );
  }
}
