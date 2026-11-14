import 'package:flutter/material.dart';

import 'package:meal_planner/features/auth/service/session_service.dart';
import 'package:meal_planner/features/home/view/home_screen.dart';
import 'package:meal_planner/features/landing/view/landing_screen.dart';

class AuthGate extends StatefulWidget {
  const new({super.key});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  final SessionService _sessionService = SessionService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _sessionService.isLoggedIn(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (snapshot.data!) {
          return const HomeScreen();
        }

        return const LandingScreen();
      },
    );
  }
}