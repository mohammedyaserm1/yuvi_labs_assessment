import 'package:flutter/material.dart';

class StatisticsHeader extends StatelessWidget {
  const StatisticsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        BackButtonCircle(),
        Expanded(child: Center(child: StatisticsTitle())),
        MoreButton(),
      ],
    );
  }
}

class StatisticsTitle extends StatelessWidget {
  const StatisticsTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Statistics',
      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
    );
  }
}

class BackButtonCircle extends StatelessWidget {
  const BackButtonCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border: Border.all(color: const Color(0xFFD9DDDF)),
        ),
        child: const Icon(Icons.chevron_left, size: 21),
      ),
    );
  }
}

class MoreButton extends StatelessWidget {
  const MoreButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(color: const Color(0xFFD9DDDF)),
      ),
      child: const Icon(Icons.more_horiz, size: 20),
    );
  }
}
