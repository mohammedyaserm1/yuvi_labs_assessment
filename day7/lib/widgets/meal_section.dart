import 'package:flutter/material.dart';

class MealSection extends StatelessWidget {
  final String title;
  final String foodName;
  final String calories;
  final String leftCalories;
  final Color cardColor;
  final Color progressColor;
  final Color buttonColor;
  final IconData imageIcon;
  final String? imagePath;
  final double progress;

  const MealSection({
    super.key,
    required this.title,
    required this.foodName,
    required this.calories,
    required this.leftCalories,
    required this.cardColor,
    required this.progressColor,
    required this.buttonColor,
    required this.imageIcon,
    this.imagePath,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 143,
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(14, 14, 14, 10),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
        children: [
          MealHeader(title: title, buttonColor: buttonColor),
          const SizedBox(height: 4),
          MealFood(
            foodName: foodName,
            calories: calories,
            imageIcon: imageIcon,
            imagePath: imagePath,
          ),
          const SizedBox(height: 10),
          CalorieProgress(
            progressColor: progressColor,
            leftCalories: leftCalories,
            progress: progress,
          ),
        ],
      ),
    );
  }
}

class MealHeader extends StatelessWidget {
  final String title;
  final Color buttonColor;

  const MealHeader({super.key, required this.title, required this.buttonColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
        ),
        AddMealButton(buttonColor: buttonColor),
      ],
    );
  }
}

class AddMealButton extends StatelessWidget {
  final Color buttonColor;

  const AddMealButton({super.key, required this.buttonColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35,
      height: 35,
      decoration: BoxDecoration(color: buttonColor, shape: BoxShape.circle),
      child: const Icon(Icons.add, color: Colors.white, size: 17),
    );
  }
}

class MealFood extends StatelessWidget {
  final String foodName;
  final String calories;
  final IconData imageIcon;
  final String? imagePath;

  const MealFood({
    super.key,
    required this.foodName,
    required this.calories,
    required this.imageIcon,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FoodImage(icon: imageIcon, imagePath: imagePath),
        const SizedBox(width: 8),
        FoodInformation(foodName: foodName, calories: calories),
      ],
    );
  }
}

class FoodImage extends StatelessWidget {
  final IconData icon;
  final String? imagePath;

  const FoodImage({super.key, required this.icon, this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35,
      height: 35,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      clipBehavior: Clip.antiAlias,
      child: imagePath != null
          ? Image.asset(imagePath!, width: 35, height: 35, fit: BoxFit.cover)
          : Icon(icon, size: 20, color: const Color(0xFF397D90)),
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
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 2),
        Row(
          children: [
            const Icon(
              Icons.local_fire_department_outlined,
              size: 18,
              color: Color(0xFF6E7072),
            ),
            const SizedBox(width: 3),
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
  final double progress;

  const CalorieProgress({
    super.key,
    required this.progressColor,
    required this.leftCalories,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CalorieBar(progressColor: progressColor, progress: progress),
        const SizedBox(height: 8),
        CalorieLabels(leftCalories: leftCalories),
      ],
    );
  }
}

class CalorieBar extends StatelessWidget {
  final Color progressColor;
  final double progress;

  const CalorieBar({
    super.key,
    required this.progressColor,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.65),
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.centerLeft,
      child: FractionallySizedBox(
        widthFactor: progress / 100,
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
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
        ),
        Text(
          '$leftCalories Left',
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
