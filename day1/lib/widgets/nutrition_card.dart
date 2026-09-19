import 'package:flutter/material.dart';

class NutritionCard extends StatelessWidget {
  final String title;
  final String value;
  final Color circleColor;
  final IconData icon;

  const NutritionCard({
    super.key,
    required this.title,
    required this.value,
    required this.circleColor,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 125,
      height: 63,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          NutritionIcon(circleColor: circleColor, icon: icon),
          const SizedBox(width: 7),
          NutritionText(title: title, value: value),
        ],
      ),
    );
  }
}

class NutritionIcon extends StatelessWidget {
  final Color circleColor;
  final IconData icon;

  const NutritionIcon({
    super.key,
    required this.circleColor,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(color: circleColor, shape: BoxShape.circle),
      child: Icon(icon, size: 19, color: const Color(0xFF151515)),
    );
  }
}

class NutritionText extends StatelessWidget {
  final String title;
  final String value;

  const NutritionText({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 11, color: Color(0xFF6E7072)),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
