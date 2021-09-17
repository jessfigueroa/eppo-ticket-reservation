part of 'helpers.dart';

Route navegarMapaFadeIn(
  BuildContext context,
  Widget page, {
  String rutaName = '',
}) {
  return PageRouteBuilder(
    pageBuilder: (_, __, ___) => page,
    settings: RouteSettings(name: rutaName),
    transitionDuration: Duration(milliseconds: 300),
    transitionsBuilder: (context, animation, _, child) {
      return FadeTransition(
        child: child,
        opacity: Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(parent: animation, curve: Curves.easeOut),
        ),
      );
    },
  );
}
