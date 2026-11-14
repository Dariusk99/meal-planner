import 'package:flutter/material.dart';

import 'package:meal_planner/features/landing/model/circle_state.dart';

class LandingCircle extends StatelessWidget {
  final CircleState state;

  const new({
    required this.state,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: state.top,
      left: state.left,
      child: Container(
        width: state.size,
        height: state.size,
        decoration: BoxDecoration(
          color: state.color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
