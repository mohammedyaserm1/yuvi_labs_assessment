import 'package:flutter/material.dart';

class MobileFrame extends StatelessWidget {
  final Widget child;

  const MobileFrame({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 352,
      height: 755,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: const Color(0xFFF7F7F7),
        borderRadius: BorderRadius.circular(42),
        border: Border.all(color: Colors.white, width: 4),
      ),
      child: child,
    );
  }
}
