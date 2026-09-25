import 'package:flutter/material.dart';

class DateSelector extends StatelessWidget {
  const DateSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 116,
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Column(
        children: [DateHeader(), SizedBox(height: 8), DateWeek()],
      ),
    );
  }
}

class DateHeader extends StatelessWidget {
  const DateHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(child: DateMonth()),
        DateArrow(icon: Icons.chevron_left),
        SizedBox(width: 8),
        DateArrow(icon: Icons.chevron_right),
      ],
    );
  }
}

class DateMonth extends StatelessWidget {
  const DateMonth({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'February 2026',
      style: TextStyle(
        fontFamily: 'Neue Plak',
        fontSize: 14,
        fontWeight: FontWeight.w900,
      ),
    );
  }
}

class DateArrow extends StatelessWidget {
  final IconData icon;

  const DateArrow({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: const BoxDecoration(
        color: Color(0xFFF1F7F9),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, size: 18),
    );
  }
}

class DateWeek extends StatelessWidget {
  const DateWeek({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        DateItem(day: 'S', date: '22'),
        DateItem(day: 'M', date: '23', selected: true),
        DateItem(day: 'T', date: '24'),
        DateItem(day: 'W', date: '25'),
        DateItem(day: 'T', date: '26'),
        DateItem(day: 'F', date: '27'),
        DateItem(day: 'S', date: '28'),
      ],
    );
  }
}

class DateItem extends StatelessWidget {
  final String day;
  final String date;
  final bool selected;

  const DateItem({
    super.key,
    required this.day,
    required this.date,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    if (selected) {
      return SelectedDateItem(day: day, date: date);
    }

    return NormalDateItem(day: day, date: date);
  }
}

class NormalDateItem extends StatelessWidget {
  final String day;
  final String date;

  const NormalDateItem({super.key, required this.day, required this.date});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DateDay(day: day),
        const SizedBox(height: 4),
        DateCircle(date: date),
      ],
    );
  }
}

class SelectedDateItem extends StatelessWidget {
  final String day;
  final String date;

  const SelectedDateItem({super.key, required this.day, required this.date});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 42,
      height: 58,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            width: 42,
            height: 58,
            decoration: BoxDecoration(
              color: const Color(0xFF397D90),
              borderRadius: BorderRadius.circular(22),
            ),
          ),
          Positioned(
            top: 7,
            child: Text(
              day,
              style: const TextStyle(
                fontSize: 10,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Positioned(
            bottom: 3,
            child: Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xFF397D90), width: 3),
              ),
              alignment: Alignment.center,
              child: Text(
                date,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DateDay extends StatelessWidget {
  final String day;

  const DateDay({super.key, required this.day});

  @override
  Widget build(BuildContext context) {
    return Text(
      day,
      style: const TextStyle(fontSize: 10, color: Color(0xFF6E7072)),
    );
  }
}

class DateCircle extends StatelessWidget {
  final String date;
  final bool selected;

  const DateCircle({super.key, required this.date, this.selected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 31,
      height: 31,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: selected ? Colors.white : const Color(0xFFF0FAFC),
        border: selected
            ? Border.all(color: const Color(0xFF397D90), width: 3)
            : null,
      ),
      child: Center(child: DateNumber(date: date)),
    );
  }
}

class DateNumber extends StatelessWidget {
  final String date;

  const DateNumber({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    return Text(
      date,
      style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
    );
  }
}
