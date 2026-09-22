import 'package:flutter/material.dart';

import '../widgets/header.dart';
import '../widgets/calorie_card.dart';
import '../widgets/nutrition_row.dart';
import '../widgets/date_selector.dart';
import '../widgets/meal_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: const HomeContent(),
        ),
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
        SizedBox(height: 10),
        DateSelector(),
        SizedBox(height: 12),
        MealSection(
          title: 'Breakfast',
          foodName: 'Croissant Sandwiche',
          calories: '142 kcal',
          leftCalories: '195',
          cardColor: const Color(0xFFD9EDF7),
          progressColor: const Color(0xFF6C9EAD),
          imageIcon: Icons.restaurant,
        ),
        SizedBox(height: 8),
        MealSection(
          title: 'Lunch',
          foodName: 'Chicken Gyri',
          calories: '80 kcal',
          leftCalories: '195',
          cardColor: Color.fromARGB(255, 225, 206, 238),
          progressColor: Color.fromARGB(255, 105, 36, 145),
          imageIcon: Icons.restaurant,
        ),
        SizedBox(height: 8),
        MealSection(
          title: 'Snacks',
          foodName: 'Paneer Tikka',
          calories: '80 kcal',
          leftCalories: '195',
          cardColor: Color.fromARGB(255, 133, 241, 173),
          progressColor: Color.fromARGB(255, 5, 150, 68),
          imageIcon: Icons.restaurant,
        ),
        SizedBox(height: 8),
      ],
    );
  }
}
