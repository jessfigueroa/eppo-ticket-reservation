part of 'widgets.dart';

class FatButtonIcon extends StatelessWidget {
  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;
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

class BotonForm extends StatelessWidget {
  // final Stream stream;
  final bool enabled;
  final Function onPressed;
  final String text;
  final Color colorText;
  // final bool noLogin;
  final Color? color;

  const BotonForm({
    required this.onPressed,
    required this.text,
    this.enabled = true,
    // this.noLogin = false,
    this.colorText = Colors.white,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            enabled ? color : Colors.grey[400],
          ),
          padding: MaterialStateProperty.all(EdgeInsets.all(0)),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
        onPressed: enabled ? () => onPressed() : null,
        child: Container(
          decoration: BoxDecoration(
            color: enabled ? color : null,
            borderRadius: BorderRadius.circular(10),
          ),
          width: double.infinity,
          height: double.infinity,
          child: Center(
            child: Text(
              text,
              style: TextStyle(color: colorText),
            ),
          ),
        ),
      ),
    );
  }
}
