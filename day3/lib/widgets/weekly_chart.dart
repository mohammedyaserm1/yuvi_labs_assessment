import 'package:flutter/material.dart';

class WeeklyChart extends StatelessWidget {
  const WeeklyChart({super.key});

  @override
  Widget build(BuildContext context) {
    return const ChartArea();
  }
}

class ChartArea extends StatelessWidget {
  const ChartArea({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 155,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ChartBar(day: 'Sun', height: 75, progress: 0.55),
          ChartBar(
            day: 'Mon',
            height: 105,
            progress: 0.95,
            selected: true,
            showValue: true,
          ),
          ChartBar(day: 'Tue', height: 75, progress: 0.65),
          ChartBar(day: 'Wed', height: 88, progress: 0.72),
          ChartBar(day: 'Thu', height: 75, progress: 0.55),
          ChartBar(day: 'Fri', height: 92, progress: 0.85),
          ChartBar(day: 'Sat', height: 98, progress: 0.82),
        ],
      ),
    );
  }
}

class ChartBar extends StatelessWidget {
  final String day;
  final double height;
  final double progress;
  final bool selected;
  final bool showValue;

  const ChartBar({
    super.key,
    required this.day,
    required this.height,
    required this.progress,
    this.selected = false,
    this.showValue = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if (showValue) const ChartValueBubble(),
        if (showValue) const SizedBox(height: 8),
        ChartBarBody(height: height, progress: progress, selected: selected),
        const SizedBox(height: 5),
        ChartDay(day: day),
      ],
    );
  }
}

class ChartValueBubble extends StatelessWidget {
  const ChartValueBubble({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 64,
      height: 20,
      decoration: BoxDecoration(
        color: const Color(0xFF397D90),
        borderRadius: BorderRadius.circular(20),
      ),
      alignment: Alignment.center,
      child: const Text(
        '1,980',
        style: TextStyle(
          fontSize: 11,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class ChartBarBody extends StatelessWidget {
  final double height;
  final double progress;
  final bool selected;

  const ChartBarBody({
    super.key,
    required this.height,
    required this.progress,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: 14,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ChartBackgroundBar(height: height),
          ChartProgressBar(progress: progress, selected: selected),
        ],
      ),
    );
  }
}

class ChartBackgroundBar extends StatelessWidget {
  final double height;

  const ChartBackgroundBar({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8,
      height: height,
      decoration: BoxDecoration(
        color: const Color(0xFFF9FBFC),
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}

class ChartProgressBar extends StatelessWidget {
  final double progress;
  final bool selected;

  const ChartProgressBar({
    super.key,
    required this.progress,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: progress,
      child: Container(
        width: 8,
        decoration: BoxDecoration(
          color: selected ? const Color(0xFF397D90) : const Color(0xFFD7EDF4),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}

class ChartDay extends StatelessWidget {
  final String day;

  const ChartDay({super.key, required this.day});

  @override
  Widget build(BuildContext context) {
    return Text(
      day,
      style: const TextStyle(fontSize: 10, color: Color(0xFF6E7072)),
    );
  }
}
