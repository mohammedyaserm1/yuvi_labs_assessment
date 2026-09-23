import 'package:flutter/material.dart';

class MealSection extends StatelessWidget {
  final String title;
  final String foodName;
  final String calories;
  final String leftCalories;
  final Color cardColor;
  final Color progressColor;
  final IconData imageIcon;

  const MealSection({
    super.key,
    required this.title,
    required this.foodName,
    required this.calories,
    required this.leftCalories,
    required this.cardColor,
    required this.progressColor,
    required this.imageIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(18, 14, 18, 12),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
        children: [
          MealHeader(title: title, progressColor: progressColor),
          const SizedBox(height: 6),
          MealFood(
            foodName: foodName,
            calories: calories,
            imageIcon: imageIcon,
          ),
          const SizedBox(height: 10),
          CalorieProgress(
            progressColor: progressColor,
            leftCalories: leftCalories,
          ),
        ],
      ),
    );
  }
}

class MealHeader extends StatelessWidget {
  final String title;
  final Color progressColor;
  const MealHeader({
    super.key,
    required this.title,
    required this.progressColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
          ),
        ),
        AddMealButton(progressColor: progressColor),
      ],
    );
  }
}

class AddMealButton extends StatelessWidget {
  final Color progressColor;
  const AddMealButton({super.key, required this.progressColor});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(color: progressColor, shape: BoxShape.circle),
      child: const Icon(Icons.add, color: Colors.white, size: 15),
    );
  }
}

class MealFood extends StatelessWidget {
  final String foodName;
  final String calories;
  final IconData imageIcon;

  const MealFood({
    super.key,
    required this.foodName,
    required this.calories,
    required this.imageIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FoodImage(icon: imageIcon),
        const SizedBox(width: 8),
        FoodInformation(foodName: foodName, calories: calories),
      ],
    );
  }
}

class FoodImage extends StatelessWidget {
  final IconData icon;

  const FoodImage({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35,
      height: 35,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        border: Border.all(color: Colors.white, width: 3),
      ),
      child: Icon(icon, size: 20, color: const Color(0xFF397D90)),
    );
  }
}

class FoodInformation extends StatelessWidget {
  final String foodName;
  final String calories;

  const FoodInformation({
    super.key,
    required this.foodName,
    required this.calories,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          foodName,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 2),
        Row(
          children: [
            const Icon(
              Icons.local_fire_department_outlined,
              size: 21,
              color: Color(0xFF6E7072),
            ),
            const SizedBox(width: 6),
            Text(
              calories,
              style: const TextStyle(fontSize: 12, color: Color(0xFF6E7072)),
            ),
          ],
        ),
      ],
    );
  }
}

class CalorieProgress extends StatelessWidget {
  final Color progressColor;
  final String leftCalories;

  const CalorieProgress({
    super.key,
    required this.progressColor,
    required this.leftCalories,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CalorieBar(progressColor: progressColor),
        const SizedBox(height: 8),
        CalorieLabels(leftCalories: leftCalories),
      ],
    );
  }
}

class CalorieBar extends StatelessWidget {
  final Color progressColor;

  const CalorieBar({super.key, required this.progressColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 7,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.65),
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.centerLeft,
      child: FractionallySizedBox(
        widthFactor: 0.75,
        child: Container(
          decoration: BoxDecoration(
            color: progressColor,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}

class CalorieLabels extends StatelessWidget {
  final String leftCalories;

  const CalorieLabels({super.key, required this.leftCalories});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Text(
            'Total Calorie',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
          ),
        ),
        Text(
          '$leftCalories Left',
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
