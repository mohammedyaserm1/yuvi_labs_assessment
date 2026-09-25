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
        HollowBoltIcon(),
        SizedBox(width: 4),
        Text(
          'Today Calorie',
          style: TextStyle(fontSize: 11, color: Color(0xFF6E7072)),
        ),
      ],
    );
  }
}

class HollowBoltIcon extends StatelessWidget {
  const HollowBoltIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 17,
      height: 17,
      child: CustomPaint(painter: HollowBoltPainter()),
    );
  }
}

class HollowBoltPainter extends CustomPainter {
  const HollowBoltPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF151515)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5
      ..strokeJoin = StrokeJoin.round;

    final path = Path()
      ..moveTo(9.5, 1)
      ..lineTo(3.5, 9)
      ..lineTo(8, 9)
      ..lineTo(6.5, 16)
      ..lineTo(13.5, 7)
      ..lineTo(9, 7)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
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
    return CustomPaint(
      size: const Size(61, 61),
      painter: CalorieRingPainter(progress: 0.79),
    );
  }
}

class CalorieRingPainter extends CustomPainter {
  final double progress;

  CalorieRingPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    final radius = size.width / 2 - 4;

    final backgroundPaint = Paint()
      ..color = const Color(0xFFDDEFF4)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 7;

    final progressPaint = Paint()
      ..color = const Color(0xFF397D90)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 7
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, backgroundPaint);

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -90 * 3.1415926535 / 180,
      2 * 3.1415926535 * progress,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CalorieRingPainter oldDelegate) {
    return oldDelegate.progress != progress;
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
