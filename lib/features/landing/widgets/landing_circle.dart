import 'package:flutter/material.dart';

import '../model/circle_state.dart';

class LandingCircle extends StatelessWidget {
  final CircleState state;

  const LandingCircle({
    super.key,
    required this.state,
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