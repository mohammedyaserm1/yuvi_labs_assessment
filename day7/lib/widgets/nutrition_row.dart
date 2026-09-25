import 'package:flutter/material.dart';

import 'nutrition_card.dart';

class NutritionRow extends StatelessWidget {
  const NutritionRow({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 63,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            NutritionCard(
              title: 'Carbs',
              value: '250g/300g',
              circleColor: const Color(0xFFFFF2DE),
              imagePath: 'assets/carbs.png',
            ),
            const SizedBox(width: 8),
            NutritionCard(
              title: 'Protein',
              value: '120g/150g',
              circleColor: const Color(0xFFE9FBDD),
              imagePath: 'assets/protein.png',
            ),
            const SizedBox(width: 8),
            NutritionCard(
              title: 'Fat',
              value: '120g/150g',
              circleColor: const Color(0xFFE8EDF2),
              imagePath: 'assets/fat.png',
            ),
          ],
        ),
      ),
    );
  }
}
