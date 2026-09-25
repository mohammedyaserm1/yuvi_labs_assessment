import 'package:flutter/material.dart';

class ActivityCards extends StatelessWidget {
  const ActivityCards({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(child: StepsCard()),
        SizedBox(width: 10),
        Expanded(child: WaterCard()),
      ],
    );
  }
}

class StepsCard extends StatelessWidget {
  const StepsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const ActivityCard(
      title: 'Steps',
      value: '1230',
      unit: 'Steps',
      imagePath: 'assets/steps_icon.png',
      iconColor: Color(0xFF4F609B),
      progress: 0.70,
    );
  }
}

class WaterCard extends StatelessWidget {
  const WaterCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const ActivityCard(
      title: 'Water',
      value: '1,8',
      unit: 'Liters',
      imagePath: 'assets/water_icon.png',
      iconColor: Color(0xFF397D90),
      progress: 0.65,
    );
  }
}

class ActivityCard extends StatelessWidget {
  final String title;
  final String value;
  final String unit;
  final String imagePath;
  final Color iconColor;
  final double progress;

  const ActivityCard({
    super.key,
    required this.title,
    required this.value,
    required this.unit,
    required this.imagePath,
    required this.iconColor,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 116,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ActivityHeader(
            title: title,
            imagePath: imagePath,
            iconColor: iconColor,
            progress: progress,
          ),
          const Spacer(),
          ActivityValue(value: value, unit: unit),
        ],
      ),
    );
  }
}

class ActivityHeader extends StatelessWidget {
  final String title;
  final String imagePath;
  final Color iconColor;
  final double progress;

  const ActivityHeader({
    super.key,
    required this.title,
    required this.iconColor,
    required this.imagePath,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: const TextStyle(fontSize: 14, color: Color(0xFF6E7072)),
          ),
        ),
        ActivityIcon(
          imagePath: imagePath,
          iconColor: iconColor,
          progress: progress,
        ),
      ],
    );
  }
}

class ActivityIcon extends StatelessWidget {
  final String imagePath;
  final Color iconColor;
  final double progress;

  const ActivityIcon({
    super.key,
    required this.imagePath,
    required this.iconColor,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 54,
      height: 54,
      child: Stack(
        alignment: Alignment.center,
        children: [
          ActivityRing(progress: progress, color: iconColor),
          ActivityIconSymbol(imagePath: imagePath),
        ],
      ),
    );
  }
}

class ActivityRing extends StatelessWidget {
  final double progress;
  final Color color;

  const ActivityRing({super.key, required this.progress, required this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 44,
      height: 44,
      child: CustomPaint(
        painter: ActivityRingPainter(progress: progress, color: color),
      ),
    );
  }
}

class ActivityRingPainter extends CustomPainter {
  final double progress;
  final Color color;

  ActivityRingPainter({required this.progress, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    const double startAngle = 120 * 3.1415926535 / 180;
    const double totalSweep = -2 * 3.1415926535;

    final Offset center = Offset(size.width / 2, size.height / 2);

    final double radius = size.width / 2 - 2.5;

    final Paint backgroundPaint = Paint()
      ..color = color.withValues(alpha: 0.18)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round;

    final Paint progressPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round;

    // Background track: 10 o'clock → 7 o'clock
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      totalSweep,
      false,
      backgroundPaint,
    );

    // Progress: starts at 10 o'clock
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      totalSweep * progress,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant ActivityRingPainter oldDelegate) {
    return oldDelegate.progress != progress || oldDelegate.color != color;
  }
}

class ActivityIconSymbol extends StatelessWidget {
  final String imagePath;

  const ActivityIconSymbol({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Image.asset(imagePath, width: 25, height: 25, fit: BoxFit.contain);
  }
}

class ActivityValue extends StatelessWidget {
  final String value;
  final String unit;

  const ActivityValue({super.key, required this.value, required this.unit});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: const TextStyle(
            fontFamily: 'Neue Plak',
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 3),
        Text(
          unit,
          style: const TextStyle(fontSize: 10, color: Color(0xFF6E7072)),
        ),
      ],
    );
  }
}
