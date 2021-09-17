part of 'widgets.dart';

class CustomBubble extends StatelessWidget {
  final double? top;
  final double? left;
  final double? rigth;
  final double? bottom;
  final double radius;
  final Color color;
  CustomBubble({
    this.top,
    this.left,
    this.rigth,
    this.bottom,
    this.radius = 40.0,
    this.color = PRIMARY_COLOR_THEME,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return Positioned(
      top: top,
      left: left,
      right: rigth,
      bottom: bottom,
      child: CircleAvatar(
        radius: radius,
        backgroundColor: color,
      ),
    );
  }
}
