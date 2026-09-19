import 'package:flutter/material.dart';

import '../widgets/header.dart';
import '../widgets/calorie_card.dart';
import '../widgets/nutrition_row.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: HomeContent(),
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 18),
        Header(),
        SizedBox(height: 18),
        CalorieCard(),
        SizedBox(height: 10),
        NutritionRow(),
      ],
    );
  }
}
