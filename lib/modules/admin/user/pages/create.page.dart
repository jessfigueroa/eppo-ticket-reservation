part of '../__user.dart';

class CreateUserPage extends StatefulWidget {
  @override
  _CreateUserPageState createState() => _CreateUserPageState();
}

class _CreateUserPageState extends State<CreateUserPage> {
  UserBloc? _userBloc;
  UserEppo? _user;
  //TODO:
  /**
   * Vamos a editar solo el estado y el rol
   */

  TextEditingController? _controllerValueRol;
  TextEditingController? _controllerRol;
  bool? _switchEstado = true;
  FormSubmitTypeState? _type;
  String? _errorRol;
  String? _title;
  String msg = "";
  bool _formValido = false;

  @override
  void initState() {
    _userBloc = BlocProvider.of<UserBloc>(context);
    _user = _userBloc!.state.user;
    _controllerValueRol = TextEditingController(text: _user?.rol);
    _controllerRol = TextEditingController(text: getRolByKey(_user?.rol ?? ''));
    _switchEstado = _user?.status ?? true;
    _formValido = false;
    _title = _user?.isNew ?? true ? "Nuevo Prospecto" : _user?.name;
    _type = _user?.isNew ?? true ? PostType() : UpdateType();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) async {
        final submitState = state.formSubmitState;
        final submitType = state.formSubmitTypeState;
        switch (submitType.runtimeType) {
          case UpdateType:
            msg = "Guardando cambios...";
            break;
          case PostType:
            msg = "Guardando...";
            break;
          default:
        }
        if (submitType is PostType || submitType is UpdateType) {
          switch (submitState.runtimeType) {
            case SuccessSubmit:
              await showAlertOkIOS(
                context,
                "Correcto!",
                "Se guardó correctamente el local",
              );
              Navigator.pop(context);
              break;
            case ErrorSubmit:
              showAlertOkIOS(
                context,
                "Error!",
                (submitState as ErrorSubmit).errorMsg,
              );
              break;
            default:
          }
        }
      },
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          final sumbitState = state.formSubmitState;
          return Stack(
            children: [
              Scaffold(
                appBar: AppBar(
                  title: Text(_title ?? ''),
                ),
                body: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      CustomTextField(
                        errorText: _errorRol,
                        readOnly: true,
                        labelText: "Rol",
                        controller: _controllerRol!,
                        onTap: () => _onTapRolCombo(
                          context,
                          getRoles(),
                        ),
                        hintText: "Click para seleccionar.",
                      ),
                      Container(
                        height: 0,
                        width: 0,
                        child: TextField(controller: _controllerValueRol),
                      ),
                      // CustomComboSlidePopUp(
                      //   items: getRoles(),
                      //   titulo: 'Rol de usuario',
                      //   noItemMsg: 'no item',
                      // ),
                      SizedBox(height: 10),
                      CustomSwitchTileEstado(
                        estado: _switchEstado!,
                        onChange: _switchChage,
                      ),
                      SizedBox(height: 10),
                      BotonForm(
                        onPressed: () => _preSaveUser(),
                        text: _TEXT_BTN_SAVE,
                        color: Theme.of(context).primaryColor,
                        enabled: _formValido,
                      )
                    ],
                  ),
                ),
              ),
              sumbitState is Submitting ? LoadingApple(text: msg) : Container(),
            ],
          );
        },
      ),
    );
  }

  _onTapRolCombo(BuildContext context, List<RolModel> roles) {
    final items = roles
        .map(
          (e) => ComboBoxModel(
            icon: Icon(e.icon),
            texto: e.rol,
            withIcon: true,
            onTap: () => _onTapRolItem(e),
          ),
        )
        .toList();
    showComboSlidePopUp(
      context,
      items: items,
      titulo: "Selecciona...",
      noItemMsg: "No hay roles registrados.",
    );
  }

  _onTapRolItem(RolModel e) {
    _controllerRol?.text = e.titulo;
    _controllerValueRol?.text = e.rol;
    _validarCampos("");
    Navigator.pop(context);
  }

  getRoles() {
    return [
      RolModel(
        titulo: 'Administrador',
        rol: 'ADMIN',
        icon: Icons.vpn_key_outlined,
        onPress: () {},
      ),
      RolModel(
        titulo: 'Cliente',
        rol: 'CLIENTE',
        icon: Icons.person_outline_rounded,
        onPress: () {},
      ),
    ];
  }

  _switchChage(bool status) {
    _switchEstado = status;
    _validarCampos('changeStatus');
  }

  _preSaveUser() {
    this._user!.rol = this._controllerValueRol?.text;
    this._user!.status = this._switchEstado!;
    _saveUser(context, _user!, _type!);
  }

  _validarCampos(String val) {
    //   _errorName = null;
    //   _errorAddress = null;
    _formValido = true;

    //   if (_controllerName!.text.length < 3) {
    //     _errorName = "La razón social debe tener al menos 3 letras";
    //     _formValido = false;
    //   }
    //   if (_controllerAddress!.text.isEmpty) {
    //     _errorAddress = "Escribe algo en tus apuntes.";
    //     _formValido = false;
    //   }
    setState(() {});
  }
}
