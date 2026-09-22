import 'package:flutter/material.dart';

import 'mobile_frame.dart';
import '../screens/statistics_screen.dart';

class CalorieCard extends StatelessWidget {
  const CalorieCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Scaffold(
              backgroundColor: Color(0xFFEDEFF0),
              body: Center(child: MobileFrame(child: StatisticsScreen())),
            ),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        height: 99,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: const Color(0xFFF0FAFC),
          borderRadius: BorderRadius.circular(2),
        ),
        child: const Row(children: [CalorieInformation(), CalorieProgress()]),
      ),
    );
  }
}

class CalorieInformation extends StatelessWidget {
  const CalorieInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [CalorieTitle(), SizedBox(height: 7), CalorieValue()],
      ),
    );
  }
}

class CalorieTitle extends StatelessWidget {
  const CalorieTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(Icons.bolt, size: 17, color: Color(0xFF151515)),
        SizedBox(width: 4),
        Text(
          'Today Calorie',
          style: TextStyle(fontSize: 11, color: Color(0xFF6E7072)),
        ),
      ],
    );
  }
}

class CalorieValue extends StatelessWidget {
  const CalorieValue({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          '1980',
          style: TextStyle(
            fontSize: 29,
            fontWeight: FontWeight.w500,
            color: Color(0xFF151515),
          ),
        ),
        SizedBox(width: 2),
        Padding(
          padding: EdgeInsets.only(bottom: 5),
          child: Text(
            'kcal',
            style: TextStyle(fontSize: 10, color: Color(0xFF6E7072)),
          ),
        ),
      ],
    );
  }
}

class CalorieProgress extends StatelessWidget {
  const CalorieProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 64,
      height: 64,
      child: Stack(
        alignment: Alignment.center,
        children: [CalorieProgressRing(), CalorieLeftText()],
      ),
    );
  }
}

class CalorieProgressRing extends StatelessWidget {
  const CalorieProgressRing({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 61,
      height: 61,
      child: CircularProgressIndicator(
        value: 0.79,
        strokeWidth: 7,
        backgroundColor: Colors.white,
        valueColor: const AlwaysStoppedAnimation<Color>(
          Color.fromARGB(255, 219, 7, 7),
        ),
      ),
    );
  }
}

class CalorieLeftText extends StatelessWidget {
  const CalorieLeftText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '520',
          style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
        ),
        Text('Left', style: TextStyle(fontSize: 8, color: Color(0xFF6E7072))),
      ],
    );
  }
}
