import 'package:flutter/material.dart';

import '../model/circle_state.dart';
import '../model/landing_frame.dart';

class LandingFramesConfig {
  LandingFramesConfig._();

  static const Color CIRCLE_COLOR_PURPLE = Color(0xFFBB84E8);
  static const Color CIRCLE_COLOR_BLUE = Color(0xFF471AA0);

  static const List<LandingFrame> frames = [
    // Variant 1
    LandingFrame(
      topLeft: CircleState(
        top: -196,
        left: -98,
        size: 359,
        color: CIRCLE_COLOR_PURPLE,
      ),
      topRight: CircleState(
        top: -376,
        left: 183,
        size: 466,
        color: CIRCLE_COLOR_BLUE,
      ),
      bottomLeft: CircleState(
        top: 833,
        left: -98,
        size: 466,
        color: CIRCLE_COLOR_BLUE,
      ),
      bottomRight: CircleState(
        top: 760,
        left: 290,
        size: 359,
        color: CIRCLE_COLOR_PURPLE,
      ),
    ),

    // Variant 2
    LandingFrame(
      topLeft: CircleState(
        top: -281,
        left: -97,
        size: 359,
        color: CIRCLE_COLOR_PURPLE,
      ),
      topRight: CircleState(
        top: -260,
        left: 216,
        size: 466,
        color: CIRCLE_COLOR_BLUE,
      ),
      bottomLeft: CircleState(
        top: 747,
        left: -139,
        size: 466,
        color: CIRCLE_COLOR_BLUE,
      ),
      bottomRight: CircleState(
        top: 854,
        left: 215,
        size: 359,
        color: CIRCLE_COLOR_PURPLE,
      ),
    ),

    // Variant 3
    LandingFrame(
      topLeft: CircleState(
        top: -198,
        left: -98,
        size: 359,
        color: CIRCLE_COLOR_BLUE,
      ),
      topRight: CircleState(
        top: -376,
        left: 183,
        size: 466,
        color: CIRCLE_COLOR_PURPLE,
      ),
      bottomLeft: CircleState(
        top: 831,
        left: -98,
        size: 466,
        color: CIRCLE_COLOR_PURPLE,
      ),
      bottomRight: CircleState(
        top: 758,
        left: 290,
        size: 359,
        color: CIRCLE_COLOR_BLUE,
      ),
    ),

    // Variant 4
    LandingFrame(
      topLeft: CircleState(
        top: -280,
        left: -98,
        size: 359,
        color: CIRCLE_COLOR_PURPLE,
      ),
      topRight: CircleState(
        top: -260,
        left: 183,
        size: 466,
        color: CIRCLE_COLOR_BLUE,
      ),
      bottomLeft: CircleState(
        top: 748,
        left: -98,
        size: 466,
        color: CIRCLE_COLOR_BLUE,
      ),
      bottomRight: CircleState(
        top: 855,
        left: 214,
        size: 359,
        color: CIRCLE_COLOR_PURPLE,
      ),
    ),
  ];
}