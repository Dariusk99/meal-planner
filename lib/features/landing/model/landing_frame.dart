import 'circle_state.dart';

class LandingFrame {
  final CircleState topLeft;
  final CircleState topRight;
  final CircleState bottomLeft;
  final CircleState bottomRight;

  const LandingFrame({
    required this.topLeft,
    required this.topRight,
    required this.bottomLeft,
    required this.bottomRight,
  });
}