import 'package:flutter/material.dart';
import 'package:meal_planner/features/landing/config/landing_frames_config.dart';

import '../model/landing_frame.dart';
import '../widgets/landing_background.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 54),
    )..repeat();
  }

  LandingFrame _currentFrame() {
    final frames = LandingFramesConfig.frames;

    const frameOrder = [0, 1, 2, 3, 2, 1];

    final scaledProgress =
        _controller.value * frameOrder.length;

    final currentStep =
        scaledProgress.floor() % frameOrder.length;

    final nextStep =
        (currentStep + 1) % frameOrder.length;

    final currentFrame =
    frames[frameOrder[currentStep]];

    final nextFrame =
    frames[frameOrder[nextStep]];

    final localProgress =
        scaledProgress - scaledProgress.floor();

    final easedProgress =
    Curves.easeOut.transform(localProgress);

    return LandingFrame.lerp(
      currentFrame,
      nextFrame,
      easedProgress,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Stack(
            children: [
              Positioned.fill(
                child: LandingBackground(
                  frame: _currentFrame(),
                ),
              ),
              Center(
                child: Image.asset(
                  'assets/logo-landing-screen.png',
                  width: 250,
                  height: 250,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}