part of '__login.dart';

class LoginPage extends StatelessWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
  final TextEditingController txtControllerEmail = TextEditingController();
  final TextEditingController txtControllerPass = TextEditingController();

  String? errorEmail;
  String? errorPass;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        final status = state.statusLogin;
        switch (status.runtimeType) {
          case ErrorLogin:
            showAlertOkIOS(
              context,
              "Login Error",
              (state.statusLogin as ErrorLogin).errorMsg,
            );
            log('Error login : ${(state.statusLogin as ErrorLogin).errorMsg}');
            break;
          case SuccessfullLogin:
            Navigator.pushReplacementNamed(context, 'main_screen');
            break;
          default:
            log(state.statusLogin.runtimeType.toString());
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            _createFondo(context),
            _createForm(context),
          ],
        ),
      ),
    );
  }

  isFormValid(val) {
    final txtEmail = txtControllerEmail.text;
    final txtPass = txtControllerPass.text;
    errorEmail = null;
    errorPass = null;
    if (txtEmail.length == 0) {
      errorEmail = '* Ingrese un email';
    }
    if (txtPass.length == 0) {
      errorPass = '* Ingrese una clave';
    }
  }

  Widget _createForm(context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SafeArea(child: Container(height: getCurrentHeight(context, 0.22))),
          Container(
            margin: EdgeInsets.only(top: 30),
            padding: EdgeInsets.symmetric(vertical: 40),
            width: getCurrentWidth(context, 0.85),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadiusDirectional.circular(5),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 7.0,
                  offset: Offset(0.0, 5.0),
                  spreadRadius: 3.0,
                )
              ],
            ),
            child: Column(
              children: [
                Text(_TEXT_LOGIN, style: _TEXT_STYLE_LOGIN),
                SizedBox(height: 40),
                _createEmail(),
                _createPassBtn(),
                SizedBox(height: 20),
                _createLoginBtn(context),
                SizedBox(height: 20),
                Text(_TEXT_OTHER_LOGIN),
                SizedBox(height: 20),
                _createGoogleBtn(context)
              ],
            ),
          ),
          TextButton(
            onPressed: () => _goToRegisterScreen(context),
            child: Text(_TEXT_REGISTER),
            style: _buttonStyleRegister,
          ),
        ],
      ),
    );
  }

  Widget _createFondo(BuildContext context) {
    final fondoMorado = Container(
      height: getCurrentHeight(context, 0.4),
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(62, 64, 149, 1.0),
            Color.fromRGBO(62, 64, 167, 1.0)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
    );
    return Stack(
      children: [
        fondoMorado,
        CustomBubble(
          top: 70,
          left: 30,
          color: Color.fromRGBO(255, 255, 255, 0.06),
        ),
        CustomBubble(
          top: -25,
          rigth: -25,
          color: Color.fromRGBO(255, 255, 255, 0.1),
        ),
        CustomBubble(
          rigth: -25,
          bottom: -25,
          color: Color.fromRGBO(255, 255, 255, 0.1),
        ),
        Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: getCurrentHeight(context, 0.1)),
              Image.asset(_IMG_LOGO_EPPO),
              SizedBox(height: 10),
              Text(_TEXT_TITLE_NAME, style: _TEXT_STYLE_TITLE)
            ],
          ),
        ),
        Positioned(
          top: 72,
          left: 128,
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 4),
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ),
      ],
    );
  }

  Widget _createEmail() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        onChanged: isFormValid,
        controller: txtControllerEmail,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          focusColor: Colors.deepPurple,
          labelText: _TEXT_EMAIL_FIELD,
          labelStyle: _TEXT_STYLE_FIELDS,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: PRIMARY_COLOR_THEME),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: PRIMARY_COLOR_THEME, width: 2),
          ),
          // counterText: snapshot.data,
          hintText: _TEXT_EMAIL_HINT,
          icon: Icon(
            Icons.alternate_email,
            color: PRIMARY_COLOR_THEME,
          ),
          errorText: errorEmail,
        ),
        // onChanged: bloc.changeEmail,
      ),
    );
  }

  Widget _createPassBtn() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: txtControllerPass,
        obscureText: true,
        onChanged: isFormValid,
        decoration: InputDecoration(
          focusColor: Colors.deepPurple,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: PRIMARY_COLOR_THEME),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: PRIMARY_COLOR_THEME, width: 2),
          ),
          labelText: _TEXT_PASS_FIELD,
          labelStyle: _TEXT_STYLE_FIELDS,
          icon: Icon(
            Icons.lock_outline,
            color: PRIMARY_COLOR_THEME,
          ),
          errorText: errorPass,
        ),
      ),
    );
  }

  Widget _createLoginBtn(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 80),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        elevation: 0.0,
        primary: PRIMARY_COLOR_THEME,
      ),
      onPressed: () => _onLoginHandle(
        context,
        txtControllerEmail.text,
        txtControllerPass.text,
      ),
      child: Container(
        child: Text(_TEXT_BUTTON_LOGIN, style: _TEXT_STYLE_BTN_LOGIN),
      ),
    );
  }

  Widget _createGoogleBtn(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        elevation: 5.0,
        primary: Colors.white,
      ),
      onPressed: () => _onLoginGoogleHandle(context),
      child: Container(
        width: getCurrentWidth(context, 0.7),
        height: 30,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 30,
              width: 30,
              child: Image.asset(_IMG_GOOGLE_LOGIN),
            ),
            SizedBox(width: 20),
            Container(
              child: Text(_TEXT_BUTTON_GOOGLE, style: _TEXT_STYLE_BTN_GOOGLE),
            ),
          ],
        ),
      ),
    );
  }
}
