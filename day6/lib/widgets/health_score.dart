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
        children: [HealthScoreRing(), HealthScoreText()],
      ),
    );
  }
}

class HealthScoreRing extends StatelessWidget {
  const HealthScoreRing({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 52,
      height: 52,
      child: CircularProgressIndicator(
        value: 0.7,
        strokeWidth: 5,
        backgroundColor: Color(0xFFDDF5DA),
        valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF4A9148)),
      ),
    );
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
          icon: Icons.grass_outlined,
          name: 'Fiber',
          value: '3g',
          warning: true,
        ),
        HealthMetricRow(
          icon: Icons.favorite_outline,
          name: 'BPM',
          value: '86bpm',
          warning: true,
        ),
        HealthMetricRow(
          icon: Icons.water_drop_outlined,
          name: 'Sugar',
          value: '17g',
          warning: false,
        ),
        HealthMetricRow(
          icon: Icons.grain,
          name: 'Sodium',
          value: '1124mg',
          warning: true,
        ),
      ],
    );
  }
}

class HealthMetricRow extends StatelessWidget {
  final IconData icon;
  final String name;
  final String value;
  final bool warning;

  const HealthMetricRow({
    super.key,
    required this.icon,
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
          MetricIcon(icon: icon),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              name,
              style: const TextStyle(fontSize: 12, color: Color(0xFF6E7072)),
            ),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 11, color: Color(0xFF6E7072)),
          ),
          const SizedBox(width: 8),
          MetricStatus(warning: warning),
        ],
      ),
    );
  }
}

class MetricIcon extends StatelessWidget {
  final IconData icon;

  const MetricIcon({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Icon(icon, size: 15, color: const Color(0xFF6E7072));
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
