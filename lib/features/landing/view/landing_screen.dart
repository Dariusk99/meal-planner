import 'package:flutter/material.dart';
import 'package:meal_planner/features/landing/config/landing_frames_config.dart';

import '../widgets/landing_circle.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final frame = LandingFramesConfig.frames.first;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          LandingCircle(state: frame.topLeft),
          LandingCircle(state: frame.topRight),
          LandingCircle(state: frame.bottomLeft),
          LandingCircle(state: frame.bottomRight),
          
          Center(
            child: Image.asset(
              'assets/logo-landing-screen.png',
              width: 250,
              height: 250,
              fit: BoxFit.contain,
            ),
          ),
        ],
      )
    );
  }
}