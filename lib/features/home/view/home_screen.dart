import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const new({super.key});

  static const Color _primaryPurple = Color(0xFF471AA0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: _primaryPurple,
        elevation: 0,
        title: const Text(
          'Meal Planner',
          style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: const Center(
        child: Text(
          'Home Screen',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: _primaryPurple,
          ),
        ),
      ),
    );
  }
}