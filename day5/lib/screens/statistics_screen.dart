import 'package:flutter/material.dart';

import '../widgets/activity_cards.dart';
import '../widgets/health_score.dart';
import '../widgets/statistics_header.dart';
import '../widgets/calorie_summary.dart';
import '../widgets/weekly_chart.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            children: const [
              SizedBox(height: 18),
              StatisticsHeader(),
              SizedBox(height: 22),
              CalorieSummary(),
              SizedBox(height: 20),
              WeeklyChart(),
              SizedBox(height: 20),
              ActivityCards(),
              SizedBox(height: 20),
              HealthScoreCard(),
            ],
          ),
        ),
      ),
    );
  }
}
