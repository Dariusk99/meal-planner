import 'package:flutter/material.dart';

import 'package:meal_planner/features/landing/model/landing_frame.dart';
import 'package:meal_planner/features/landing/widgets/landing_circle.dart';

class LandingBackground extends StatelessWidget {
  final LandingFrame frame;

  const new({
    required this.frame,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        LandingCircle(state: frame.topLeft),
        LandingCircle(state: frame.topRight),
        LandingCircle(state: frame.bottomLeft),
        LandingCircle(state: frame.bottomRight),
      ],
    );
  }
}
