import 'package:flutter/material.dart';

class NutritionCard extends StatelessWidget {
  final String title;
  final String value;
  final Color circleColor;
  final String imagePath;

  const NutritionCard({
    super.key,
    required this.title,
    required this.value,
    required this.circleColor,
    required this.imagePath,
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
          NutritionIcon(circleColor: circleColor, imagePath: imagePath),
          const SizedBox(width: 7),
          NutritionText(title: title, value: value, circleColor: circleColor),
        ],
      ),
    );
  }
}

class NutritionIcon extends StatelessWidget {
  final Color circleColor;
  final String imagePath;

  const NutritionIcon({
    super.key,
    required this.circleColor,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(color: circleColor, shape: BoxShape.circle),
      child: Image.asset(imagePath, width: 24, height: 24, fit: BoxFit.contain),
    );
  }
}

class NutritionText extends StatelessWidget {
  final String title;
  final String value;
  final Color circleColor;

  const NutritionText({
    super.key,
    required this.title,
    required this.value,
    required this.circleColor,
  });

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
        const SizedBox(height: 4),
        NutritionProgress(progress: _getProgress(), circleColor: circleColor),
        const SizedBox(height: 3),
        Text(
          value,
          style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  double _getProgress() {
    final parts = value.replaceAll('g', '').split('/');

    final consumed = double.tryParse(parts[0]) ?? 0;
    final limit = double.tryParse(parts[1]) ?? 1;

    return consumed / limit;
  }
}

class NutritionProgress extends StatelessWidget {
  final double progress;
  final Color circleColor;
  const NutritionProgress({
    super.key,
    required this.progress,
    required this.circleColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 58,
      height: 3,
      decoration: BoxDecoration(
        color: const Color(0xFFE5E5E5),
        borderRadius: BorderRadius.circular(3),
      ),
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor: progress.clamp(0.0, 1.0),
        child: Container(
          decoration: BoxDecoration(
            color: circleColor,
            borderRadius: BorderRadius.circular(3),
          ),
        ),
      ),
    );
  }
}
