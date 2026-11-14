import 'package:flutter/material.dart';
import 'package:meal_planner/features/auth/view/auth_gate.dart';

import 'package:meal_planner/features/landing/view/landing_screen.dart';

void main() {
  runApp(const MealPlannerApp());
}

class MealPlannerApp extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthGate(),
    );
  }
}
