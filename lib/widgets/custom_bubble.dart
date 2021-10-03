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

class PillWidget extends StatelessWidget {
  final String texto;
  final Color color;
  const PillWidget({required this.texto, required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          height: 14,
          // width: texto.length * 7.5,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              texto.trim(),
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
