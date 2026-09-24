import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 55,
      child: Row(
        children: [
          ProfileAvatar(),
          SizedBox(width: 10),
          Greeting(),
          Spacer(),
          NotificationButton(),
        ],
      ),
    );
  }
}

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(shape: BoxShape.circle),
      child: Image.asset('assets/profile.png', fit: BoxFit.cover),
    );
  }
}

class Greeting extends StatelessWidget {
  const Greeting({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Good Morning 👋',
          style: TextStyle(fontSize: 11, color: Color(0xFF6E7072)),
        ),
        SizedBox(height: 2),
        Text(
          'Ann Ezechukwu',
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: Color(0xFF151515),
          ),
        ),
      ],
    );
  }
}

class NotificationButton extends StatelessWidget {
  const NotificationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        border: Border.all(color: const Color(0xFFD4D8DA)),
      ),
      child: const Icon(
        Icons.notifications_none_rounded,
        size: 21,
        color: Color(0xFF151515),
      ),
    );
  }
}
