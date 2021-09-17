part of '__register.dart';

//########################## LABELS FROM REGISTER SCREEN ##############################
const _TEXT_REGISTER = 'Registro';
const _TEXT_LOGIN = 'Tengo una cuenta';
const _TEXT_TITLE_NAME = 'Eppo S.A';
const _TEXT_BUTTON_REGISTER = 'Registrar';
const _TEXT_BUTTON_GOOGLE = 'Continuar con Google';
const _TEXT_EMAIL_FIELD = 'Correo electrónico';
const _TEXT_EMAIL_HINT = 'ejemplo@correo.com';
const _TEXT_PASS_FIELD = 'Contraseña';
const _TEXT_OTHER_REGISTER = 'O registrate con';

//########################## STYLES FROM TEXTS ##############################
const _TEXT_STYLE_REGISTER =
    TextStyle(fontWeight: FontWeight.w400, fontSize: 20);
const _TEXT_STYLE_TITLE = TextStyle(color: Colors.white, fontSize: 25);
const _TEXT_STYLE_BTN_REGISTER = TextStyle(color: Colors.white);
const _TEXT_STYLE_BTN_GOOGLE = TextStyle(color: Colors.black);
const _TEXT_STYLE_FIELDS = TextStyle(color: PRIMARY_COLOR_THEME);
//########################## STYLES FROM BUTTONS ##############################
// final _buttonStyleREGISTER =
// final _buttonStyleGoogle = ElevatedButton.styleFrom(
//   padding: EdgeInsets.symmetric(vertical: 15, horizontal: 80),
//   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
//   elevation: 0.0,
//   primary: Colors.white,
// );

final _buttonStyleRegister = TextButton.styleFrom(
  primary: PRIMARY_COLOR_THEME,
);

//########################## IMAGES FROM REGISTER SCREEN ##############################
const _IMG_LOGO_EPPO = 'assets/images/eppo_logo.png';
const _IMG_GOOGLE_REGISTER = 'assets/images/google.png';
