part of 'widgets.dart';

class FatButtonIcon extends StatelessWidget {
  final IconData icon;
  final String texto;
  final Color color1, color2;
  final Function() onPress;

  const FatButtonIcon(
    this.icon,
    this.texto,
    this.onPress, {
    this.color1 = Colors.grey,
    this.color2 = Colors.blueGrey,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Stack(
        children: [
          _FatButtonIcon(
            icon,
            color1: color1,
            color2: color2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 100, width: 40),
              Icon(icon, color: Colors.white, size: 30),
              SizedBox(width: 20),
              Expanded(
                child: Text(texto, style: TextStyle(color: Colors.white)),
              ),
              Icon(Icons.arrow_forward_ios, color: Colors.white),
              SizedBox(width: 25),
            ],
          ),
        ],
      ),
    );
  }
}

class _FatButtonIcon extends StatelessWidget {
  final IconData icon;
  final Color color1, color2;
  const _FatButtonIcon(
    this.icon, {
    this.color1 = Colors.grey,
    this.color2 = Colors.blueGrey,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        gradient: LinearGradient(colors: [color1, color2]),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            spreadRadius: 3,
            offset: Offset(3, 3),
            color: Colors.black38,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        child: Stack(
          children: [
            Positioned(
              top: -15,
              right: 10,
              child: Icon(
                icon,
                color: Colors.white.withOpacity(0.2),
                size: 100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
