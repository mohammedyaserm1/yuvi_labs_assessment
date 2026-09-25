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

  static const double backgroundHeight = 105;
  static const double barWidth = 8;
  static const double maxValue = 1980;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 165,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ChartBar(day: 'Sun', value: 850),
          ChartBar(day: 'Mon', value: 1980, selected: true, showValue: true),
          ChartBar(day: 'Tue', value: 1050),
          ChartBar(day: 'Wed', value: 1350),
          ChartBar(day: 'Thu', value: 850),
          ChartBar(day: 'Fri', value: 1650),
          ChartBar(day: 'Sat', value: 1750),
        ],
      ),
    );
  }
}

class ChartBar extends StatelessWidget {
  final String day;
  final double value;
  final bool selected;
  final bool showValue;

  const ChartBar({
    super.key,
    required this.day,
    required this.value,
    this.selected = false,
    this.showValue = false,
  });

  @override
  Widget build(BuildContext context) {
    final double progress = (value / ChartArea.maxValue).clamp(0.0, 1.0);

    return SizedBox(
      width: 30,
      height: 165,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: [
          ChartBarBody(progress: progress, selected: selected),

          if (showValue)
            const Positioned(bottom: 132, left: -14, child: ChartValueBubble()),

          Positioned(bottom: 0, child: ChartDay(day: day)),
        ],
      ),
    );
  }
}

class ChartValueBubble extends StatelessWidget {
  const ChartValueBubble({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 27,
      decoration: BoxDecoration(
        color: const Color(0xFF397D90),
        borderRadius: BorderRadius.circular(20),
      ),
      alignment: Alignment.center,
      child: const Text(
        '1,980',
        style: TextStyle(
          fontFamily: 'Neue Plak',
          fontSize: 11,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class ChartBarBody extends StatelessWidget {
  final double progress;
  final bool selected;

  const ChartBarBody({
    super.key,
    required this.progress,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 22,
      child: SizedBox(
        width: 14,
        height: ChartArea.backgroundHeight,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            const ChartBackgroundBar(),
            ChartProgressBar(progress: progress, selected: selected),
          ],
        ),
      ),
    );
  }
}

class ChartBackgroundBar extends StatelessWidget {
  const ChartBackgroundBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ChartArea.barWidth,
      height: ChartArea.backgroundHeight,
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
        width: ChartArea.barWidth,
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
