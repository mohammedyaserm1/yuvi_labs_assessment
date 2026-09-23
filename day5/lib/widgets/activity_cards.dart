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
    );
  }
}

class ActivityCard extends StatelessWidget {
  final String title;
  final String value;
  final String unit;
  final IconData icon;
  final Color iconColor;

  const ActivityCard({
    super.key,
    required this.title,
    required this.value,
    required this.unit,
    required this.icon,
    required this.iconColor,
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
          ActivityHeader(title: title, icon: icon, iconColor: iconColor),
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

  const ActivityHeader({
    super.key,
    required this.title,
    required this.icon,
    required this.iconColor,
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
        ActivityIcon(icon: icon, iconColor: iconColor),
      ],
    );
  }
}

class ActivityIcon extends StatelessWidget {
  final IconData icon;
  final Color iconColor;

  const ActivityIcon({super.key, required this.icon, required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 43,
      height: 43,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: iconColor.withValues(alpha: 0.2), width: 5),
      ),
      child: Icon(icon, color: iconColor, size: 24),
    );
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
