import 'package:flutter/material.dart';

class ActivityCards extends StatelessWidget {
  const ActivityCards({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(child: StepsCard()),
        SizedBox(width: 10),
        Expanded(child: WaterCard()),
      ],
    );
  }
}

class StepsCard extends StatelessWidget {
  const StepsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const ActivityCard(
      title: 'Steps',
      value: '1230',
      unit: 'Steps',
      icon: Icons.directions_walk,
      iconColor: Color(0xFF4F609B),
      progress: 0.78,
    );
  }
}

class WaterCard extends StatelessWidget {
  const WaterCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const ActivityCard(
      title: 'Water',
      value: '1,8',
      unit: 'Liters',
      icon: Icons.water_drop_outlined,
      iconColor: Color(0xFF397D90),
      progress: 0.65,
    );
  }
}

class ActivityCard extends StatelessWidget {
  final String title;
  final String value;
  final String unit;
  final IconData icon;
  final Color iconColor;
  final double progress;

  const ActivityCard({
    super.key,
    required this.title,
    required this.value,
    required this.unit,
    required this.icon,
    required this.iconColor,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 116,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ActivityHeader(
            title: title,
            icon: icon,
            iconColor: iconColor,
            progress: progress,
          ),
          const Spacer(),
          ActivityValue(value: value, unit: unit),
        ],
      ),
    );
  }
}

class ActivityHeader extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color iconColor;
  final double progress;

  const ActivityHeader({
    super.key,
    required this.title,
    required this.icon,
    required this.iconColor,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: const TextStyle(fontSize: 14, color: Color(0xFF6E7072)),
          ),
        ),
        ActivityIcon(icon: icon, iconColor: iconColor, progress: progress),
      ],
    );
  }
}

class ActivityIcon extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final double progress;

  const ActivityIcon({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 54,
      height: 54,
      child: Stack(
        alignment: Alignment.center,
        children: [
          ActivityRing(progress: progress, color: iconColor),
          ActivityIconSymbol(icon: icon, color: iconColor),
        ],
      ),
    );
  }
}

class ActivityRing extends StatelessWidget {
  final double progress;
  final Color color;

  const ActivityRing({super.key, required this.progress, required this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: CircularProgressIndicator(
        value: progress,
        strokeWidth: 5,
        backgroundColor: color.withValues(alpha: 0.18),
        valueColor: AlwaysStoppedAnimation<Color>(color),
      ),
    );
  }
}

class ActivityIconSymbol extends StatelessWidget {
  final IconData icon;
  final Color color;

  const ActivityIconSymbol({
    super.key,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(icon, size: 23, color: color);
  }
}

class ActivityValue extends StatelessWidget {
  final String value;
  final String unit;

  const ActivityValue({super.key, required this.value, required this.unit});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 3),
        Text(
          unit,
          style: const TextStyle(fontSize: 10, color: Color(0xFF6E7072)),
        ),
      ],
    );
  }
}
