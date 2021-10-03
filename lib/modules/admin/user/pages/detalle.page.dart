part of '../__user.dart';

class DetalleUserPage extends StatefulWidget {
  const DetalleUserPage({Key? key}) : super(key: key);

  @override
  _DetalleUserPageState createState() => _DetalleUserPageState();
}

class _DetalleUserPageState extends State<DetalleUserPage> {
  UserBloc? _userBloc;
  UserEppo? _user;
  String? _title;

  @override
  void initState() {
    _userBloc = BlocProvider.of<UserBloc>(context);
    _user = _userBloc!.state.user;
    _title = _user?.isNew ?? true ? "Nuevo Prospecto" : _user?.name;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title ?? ''),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: _BodyUsuarioDetalle(),
        ),
      ),
    );
  }
}

class _BodyUsuarioDetalle extends StatefulWidget {
  final bool isPerfil;
  const _BodyUsuarioDetalle({this.isPerfil = false});

  @override
  __BodyUsuarioDetalleState createState() => __BodyUsuarioDetalleState();
}

class __BodyUsuarioDetalleState extends State<_BodyUsuarioDetalle> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        final user = state.user;
        if (user == null)
          return Center(
            child: CircularProgressIndicator(),
          );
        final _campoNameTS = TextStyle(
            color: Theme.of(context).primaryColor, fontWeight: FontWeight.w600);
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularImageAvatar(user.photo),
                  Column(
                    crossAxisAlignment: widget.isPerfil
                        ? CrossAxisAlignment.center
                        : CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          user.capitalName,
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          PillWidget(
                            texto: user.uidReduce,
                            color: Theme.of(context).primaryColor,
                          ),
                          SizedBox(width: 5),
                          PillWidget(texto: '24', color: Colors.blue)
                        ],
                      ),
                      OutlinedButton(
                        onPressed: () => _goToEditUser(context, user),
                        child: Text(
                          "Editar",
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        ),
                      )
                      // : Container(),
                    ],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ItemHeader(
                    name: "Viajes",
                    value: "50",
                  ),
                  ItemHeader(
                    name: "${user.tiempoRegistrado['tiempo']}",
                    value: "${user.tiempoRegistrado['cantidad']}",
                  ),
                  ItemHeader(
                    name: "Estado",
                    value: user.status ? 'Activo' : 'Inactivo',
                  ),
                  // ),
                ],
              ),
              SizedBox(height: 20),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Nombre:", style: _campoNameTS),
                          SizedBox(width: 5),
                          Text(user.capitalName),
                        ],
                      ),
                      SizedBox(height: 5),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Dni: ", style: _campoNameTS),
                          SizedBox(width: 5),
                          Text(user.dniString),
                        ],
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("UID: ", style: _campoNameTS),
                          SizedBox(width: 5),
                          Text(user.uid!),
                        ],
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Teléfono:", style: _campoNameTS),
                          Text(user.numberPhone),
                        ],
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Corréo:", style: _campoNameTS),
                          Text(user.email ?? ''),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 50),
              Icon(
                Icons.business_center_outlined,
                size: 28,
                color: PRIMARY_COLOR_THEME,
              ),
            ],
          ),
        );
      },
    );
  }
}

class ItemHeader extends StatelessWidget {
  final String name;
  final String value;
  const ItemHeader({required this.name, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          name,
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w500,
            fontSize: 11,
          ),
        ),
      ],
    );
  }
}
