import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  static const Color CIRCLE_COLOR_PURPLE = Color(0xFFBB84E8);
  static const Color CIRCLE_COLOR_BLUE = Color(0xFF471AA0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          // Lewe górne koło
          Positioned(
            top: -196,
            left: -98,
            child: buildCircle(size: 359, color: CIRCLE_COLOR_PURPLE),
          ),

          // Prawe górne koło
          Positioned(
            top: -376,
            left: 183,
            child: buildCircle(size: 466, color: CIRCLE_COLOR_BLUE),
          ),

          // Lewe dolne koło
          Positioned(
            top: 833,
            left: -98,
            child: buildCircle(size: 466, color: CIRCLE_COLOR_BLUE),
          ),

          // Prawe dolne koło
          Positioned(
            top: 760,
            left: 290,
            child: buildCircle(size: 359, color: CIRCLE_COLOR_PURPLE),
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
      )
    );
  }

  Widget buildCircle({
    required double size,
    required Color color,
  }) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle
      ),
    );
  }
}