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

  static LandingFrame lerp(
      LandingFrame start,
      LandingFrame end,
      double progress,
      ) {
    return LandingFrame(
      topLeft: CircleState.lerp(
        start.topLeft,
        end.topLeft,
        progress,
      ),
      topRight: CircleState.lerp(
        start.topRight,
        end.topRight,
        progress,
      ),
      bottomLeft: CircleState.lerp(
        start.bottomLeft,
        end.bottomLeft,
        progress,
      ),
      bottomRight: CircleState.lerp(
        start.bottomRight,
        end.bottomRight,
        progress,
      ),
    );
  }
}