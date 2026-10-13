import 'package:flutter/material.dart';

import '../model/landing_frame.dart';
import 'landing_circle.dart';

class LandingBackground extends StatelessWidget {
  final LandingFrame frame;

  const LandingBackground({
    super.key,
    required this.frame,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.hardEdge,
      children: [
        LandingCircle(state: frame.topLeft),
        LandingCircle(state: frame.topRight),
        LandingCircle(state: frame.bottomLeft),
        LandingCircle(state: frame.bottomRight),
      ],
    );
  }
}