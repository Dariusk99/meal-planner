import 'package:flutter/material.dart';

class CircleState {
  final double top;
  final double left;
  final double size;
  final Color color;

  const CircleState({
    required this.top,
    required this.left,
    required this.size,
    required this.color,
  });

  static CircleState lerp(
      CircleState start,
      CircleState end,
      double progress,
      ) {
    return CircleState(
      left: _lerpDouble(start.left, end.left, progress),
      top: _lerpDouble(start.top, end.top, progress),
      size: _lerpDouble(start.size, end.size, progress),
      color: Color.lerp(
        start.color,
        end.color,
        progress,
      )!,
    );
  }

  static double _lerpDouble(
      double start,
      double end,
      double progress,
      ) {
    return start + (end - start) * progress;
  }
}