import 'package:flutter/material.dart';

import 'package:meal_planner/features/landing/model/circle_state.dart';
import 'package:meal_planner/features/landing/model/landing_frame.dart';

class LandingFramesConfig {
  new _();

  static const Color circleColorPurple = Color(0xFFBB84E8);
  static const Color circleColorBlue = Color(0xFF471AA0);

  static const List<LandingFrame> frames = [
    // Variant 1
    LandingFrame(
      topLeft: CircleState(
        top: -196,
        left: -98,
        size: 359,
        color: circleColorPurple,
      ),
      topRight: CircleState(
        top: -376,
        left: 183,
        size: 466,
        color: circleColorBlue,
      ),
      bottomLeft: CircleState(
        top: 833,
        left: -98,
        size: 466,
        color: circleColorBlue,
      ),
      bottomRight: CircleState(
        top: 760,
        left: 290,
        size: 359,
        color: circleColorPurple,
      ),
    ),

    // Variant 2
    LandingFrame(
      topLeft: CircleState(
        top: -281,
        left: -97,
        size: 359,
        color: circleColorPurple,
      ),
      topRight: CircleState(
        top: -260,
        left: 216,
        size: 466,
        color: circleColorBlue,
      ),
      bottomLeft: CircleState(
        top: 747,
        left: -139,
        size: 466,
        color: circleColorBlue,
      ),
      bottomRight: CircleState(
        top: 854,
        left: 215,
        size: 359,
        color: circleColorPurple,
      ),
    ),

    // Variant 3
    LandingFrame(
      topLeft: CircleState(
        top: -198,
        left: -98,
        size: 359,
        color: circleColorBlue,
      ),
      topRight: CircleState(
        top: -376,
        left: 183,
        size: 466,
        color: circleColorPurple,
      ),
      bottomLeft: CircleState(
        top: 831,
        left: -98,
        size: 466,
        color: circleColorPurple,
      ),
      bottomRight: CircleState(
        top: 758,
        left: 290,
        size: 359,
        color: circleColorBlue,
      ),
    ),

    // Variant 4
    LandingFrame(
      topLeft: CircleState(
        top: -280,
        left: -98,
        size: 359,
        color: circleColorPurple,
      ),
      topRight: CircleState(
        top: -260,
        left: 183,
        size: 466,
        color: circleColorBlue,
      ),
      bottomLeft: CircleState(
        top: 748,
        left: -98,
        size: 466,
        color: circleColorBlue,
      ),
      bottomRight: CircleState(
        top: 855,
        left: 214,
        size: 359,
        color: circleColorPurple,
      ),
    ),
  ];
}
