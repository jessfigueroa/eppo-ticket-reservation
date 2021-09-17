part of '__login.dart';

//########################## LABELS FROM LOGIN SCREEN ##############################
const _TEXT_LOGIN = 'Ingreso';
const _TEXT_REGISTER = 'Crear una cuenta';
const _TEXT_TITLE_NAME = 'Eppo S.A';
const _TEXT_BUTTON_LOGIN = 'Ingresar';
const _TEXT_BUTTON_GOOGLE = 'Continuar con Google';
const _TEXT_EMAIL_FIELD = 'Correo electrónico';
const _TEXT_EMAIL_HINT = 'ejemplo@correo.com';
const _TEXT_PASS_FIELD = 'Contraseña';
const _TEXT_OTHER_LOGIN = 'O inicia sesion con';

//########################## STYLES FROM TEXTS ##############################
const _TEXT_STYLE_LOGIN = TextStyle(fontWeight: FontWeight.w400, fontSize: 20);
const _TEXT_STYLE_TITLE = TextStyle(color: Colors.white, fontSize: 25);
const _TEXT_STYLE_BTN_LOGIN = TextStyle(color: Colors.white);
const _TEXT_STYLE_BTN_GOOGLE = TextStyle(color: Colors.black);
const _TEXT_STYLE_FIELDS = TextStyle(color: PRIMARY_COLOR_THEME);
//########################## STYLES FROM BUTTONS ##############################
// final _buttonStyleLogin =
// final _buttonStyleGoogle = ElevatedButton.styleFrom(
//   padding: EdgeInsets.symmetric(vertical: 15, horizontal: 80),
//   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
//   elevation: 0.0,
//   primary: Colors.white,
// );

final _buttonStyleRegister = TextButton.styleFrom(
  primary: PRIMARY_COLOR_THEME,
);

//########################## IMAGES FROM LOGIN SCREEN ##############################
const _IMG_LOGO_EPPO = 'assets/images/eppo_logo.png';
const _IMG_GOOGLE_LOGIN = 'assets/images/google.png';
