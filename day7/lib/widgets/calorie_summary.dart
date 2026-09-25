import 'package:flutter/material.dart';

class CalorieSummary extends StatelessWidget {
  const CalorieSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [CalorieTitle(), SizedBox(height: 5), CalorieValues()],
    );
  }
}

class CalorieTitle extends StatelessWidget {
  const CalorieTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Calories',
      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
    );
  }
}

class CalorieValues extends StatelessWidget {
  const CalorieValues({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [CalorieNumber(), CalorieUnit(), Spacer(), CalorieTarget()],
    );
  }
}

class CalorieNumber extends StatelessWidget {
  const CalorieNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      '1980',
      style: TextStyle(
        fontFamily: 'Neue Plak',
        fontSize: 29,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class CalorieUnit extends StatelessWidget {
  const CalorieUnit({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 3, bottom: 5),
      child: Text(
        'Kcal',
        style: TextStyle(fontSize: 11, color: Color(0xFF6E7072)),
      ),
    );
  }
}

class CalorieTarget extends StatelessWidget {
  const CalorieTarget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(bottom: 5),
      child: Row(
        children: [
          Text(
            'Target:',
            style: TextStyle(fontSize: 11, color: Color(0xFF6E7072)),
          ),
          Text(
            '2500 ',
            style: TextStyle(
              fontFamily: 'Neue Plak',
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
          Text(
            'Kcal',
            style: TextStyle(fontSize: 11, color: Color(0xFF6E7072)),
          ),
        ],
      ),
    );
  }
}
