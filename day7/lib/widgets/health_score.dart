import 'package:flutter/material.dart';

class HealthScoreCard extends StatelessWidget {
  const HealthScoreCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Column(
        children: [HealthScoreHeader(), SizedBox(height: 14), HealthMetrics()],
      ),
    );
  }
}

class HealthScoreHeader extends StatelessWidget {
  const HealthScoreHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(child: HealthScoreTitle()),
        HealthScoreCircle(),
      ],
    );
  }
}

class HealthScoreTitle extends StatelessWidget {
  const HealthScoreTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Health score',
          style: TextStyle(fontSize: 14, color: Color(0xFF6E7072)),
        ),
        SizedBox(height: 3),
        Text(
          'Good',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}

class HealthScoreCircle extends StatelessWidget {
  const HealthScoreCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 52,
      height: 52,
      child: Stack(
        alignment: Alignment.center,
        children: [
          HealthScoreRing(),
          Text(
            '7/10',
            style: TextStyle(
              fontFamily: 'Neue Plak',
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class HealthScoreRing extends StatelessWidget {
  const HealthScoreRing({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(52, 52),
      painter: HealthScoreRingPainter(progress: 0.7),
    );
  }
}

class HealthScoreRingPainter extends CustomPainter {
  final double progress;

  HealthScoreRingPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    const double startAngle = -125 * 3.1415926535 / 180;
    const double totalSweep = 2 * 3.1415926535;

    final Offset center = Offset(size.width / 2, size.height / 2);

    final double radius = size.width / 2 - 2.5;

    final Paint backgroundPaint = Paint()
      ..color = const Color(0xFFDDF5DA)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round;

    final Paint progressPaint = Paint()
      ..color = const Color(0xFF4A9148)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round;

    // Background ring
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      totalSweep,
      false,
      backgroundPaint,
    );

    // Progress ring
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      totalSweep * progress,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant HealthScoreRingPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}

class HealthScoreText extends StatelessWidget {
  const HealthScoreText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      '7/10',
      style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
    );
  }
}

class HealthMetrics extends StatelessWidget {
  const HealthMetrics({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        HealthMetricRow(
          imagePath: 'assets/fiber.png',
          name: 'Fiber',
          value: '3g',
          warning: true,
        ),
        HealthMetricRow(
          imagePath: 'assets/bpm.png',
          name: 'BPM',
          value: '86bpm',
          warning: true,
        ),
        HealthMetricRow(
          imagePath: 'assets/sugar.png',
          name: 'Sugar',
          value: '17g',
          warning: false,
        ),
        HealthMetricRow(
          imagePath: 'assets/sodium.png',
          name: 'Sodium',
          value: '1124mg',
          warning: true,
        ),
      ],
    );
  }
}

class HealthMetricRow extends StatelessWidget {
  final String imagePath;
  final String name;
  final String value;
  final bool warning;

  const HealthMetricRow({
    super.key,
    required this.imagePath,
    required this.name,
    required this.value,
    required this.warning,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          MetricIcon(imagePath: imagePath),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              name,
              style: const TextStyle(fontSize: 12, color: Color(0xFF6E7072)),
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontFamily: 'Neue Plak',
              fontSize: 11,
              color: Color(0xFF6E7072),
            ),
          ),
          const SizedBox(width: 8),
          MetricStatus(warning: warning),
        ],
      ),
    );
  }
}

class MetricIcon extends StatelessWidget {
  final String imagePath;

  const MetricIcon({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Image.asset(imagePath, width: 18, height: 18, fit: BoxFit.contain);
  }
}

class MetricStatus extends StatelessWidget {
  final bool warning;

  const MetricStatus({super.key, required this.warning});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 5,
      height: 5,
      decoration: BoxDecoration(
        color: warning ? const Color(0xFFD94A4A) : const Color(0xFF4B9B4B),
        shape: BoxShape.circle,
      ),
    );
  }
}
