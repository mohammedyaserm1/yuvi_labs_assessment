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
        clipBehavior: Clip.none,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(18, 1, 18, 20),
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
          cardColor: Color.fromARGB(255, 217, 236, 246),
          progressColor: Color.fromARGB(255, 121, 158, 174),
          buttonColor: Color.fromARGB(255, 58, 125, 145),
          imageIcon: Icons.restaurant,
          imagePath: 'assets/breakfast.png',
          progress: 75,
        ),
        SizedBox(height: 8),
        MealSection(
          title: 'Lunch',
          foodName: 'Chicken Gyri',
          calories: '142 kcal',
          leftCalories: '195',
          cardColor: Color.fromARGB(255, 239, 230, 245),
          progressColor: Color.fromARGB(255, 133, 139, 176),
          buttonColor: Color.fromARGB(255, 63, 78, 143),
          imageIcon: Icons.restaurant,
          imagePath: 'assets/lunch.png',
          progress: 40,
        ),
        SizedBox(height: 8),
        MealSection(
          title: 'Snacks',
          foodName: 'Paneer Tikka',
          calories: '80 kcal',
          leftCalories: '195',
          cardColor: Color.fromARGB(255, 181, 244, 204),
          progressColor: Color.fromARGB(255, 70, 190, 122),
          buttonColor: Color.fromARGB(255, 1, 120, 53),
          imageIcon: Icons.restaurant,
          progress: 60,
        ),
        SizedBox(height: 8),
      ],
    );
  }
}
