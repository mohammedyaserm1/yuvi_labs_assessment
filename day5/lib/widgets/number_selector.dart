import 'package:flutter/material.dart';

class NumberSelector extends StatelessWidget {
  final int n;

  const NumberSelector({super.key, required this.n});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: n,
        itemBuilder: (context, index) {
          final number = index + 1;

          return NumberItem(number: number);
        },
      ),
    );
  }
}

class NumberItem extends StatelessWidget {
  final int number;

  const NumberItem({super.key, required this.number});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 38,
      height: 38,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
      alignment: Alignment.center,
      child: Text(
        '$number',
        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
      ),
    );
  }
}
