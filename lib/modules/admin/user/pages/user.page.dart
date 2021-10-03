part of '../__user.dart';

class UserAdminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_TEXT_TITLE_SCREEN),
      ),
      body: _UserBody(),
      drawer: CustomDrawerView(),
      // floatingActionButton: _CreateFloatingButton(),
    );
  }
}

class _UserBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return StreamBuilder(
          stream: state.usersStream,
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData)
              return Center(
                child: Text(_TEXT_NO_DATA),
              );
            final documents = snapshot.data?.docs;
            return ListView.builder(
              itemCount: documents?.length ?? 0,
              itemBuilder: (context, index) {
                final userDoc = documents?[index];
                final user =
                    UserEppo.fromFirabaseQueryDocumentSnapshot(userDoc);
                return ListTileusers(
                  onTap: () => _goToEditUser(context, user),
                  user: user,
                );
                // return ListTile(
                //   onTap: () => _goToEdituser(context, user),
                //   leading: Icon(Icons.public),
                //   title: Text(user.name!),
                //   subtitle: Text(user.email ?? ''),
                // );
              },
            );
          },
        );
      },
    );
  }
}

class ListTileusers extends StatelessWidget {
  final UserEppo user;
  final bool isSelector;
  final Function() onTap;
  const ListTileusers({
    required this.user,
    required this.onTap,
    this.isSelector = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor:
          !user.status ? Colors.red.withOpacity(0.1) : Colors.transparent,
      leading: Hero(
        tag: user.uid!,
        child: Container(
          height: 50,
          width: 50,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: user.photo,
          ),
        ),
      ),
      title: Text(user.capitalName),
      subtitle: Text(user.email!),
      trailing: IconButton(
        icon: Icon(Icons.phone),
        onPressed: () => _callUser(context, user.phoneNumber),
      ),
      onTap: isSelector ? onTap : () => _goToDetalleUser(context, user),
      // onLongPress: () {
      //   showAlertEditDeleteIOS(
      //     context,
      //     contenidoConfirmacionDelete:
      //         "¿Seguro deseas eliminar al user: '${user.getNombreuser()}'?",
      //     onDeleteAction: () => _deleteUser(context),
      //     onEditAction: () => _editUser(context),
      //   );
      // },
    );
  }

  _deleteUser(BuildContext context) {
    // BlocProvider.of<userBloc>(context).add(
    //   OnDeleteuser(user),
    // );
  }

  void _editUser(BuildContext context) {
    // BlocProvider.of<userBloc>(context).add(
    //   OnUsuairoDetalle(user),
    // );
    // Navigator.pushNamed(context, "user_formulario_view");
  }

  _detalleUser(BuildContext context) {
    // BlocProvider.of<userBloc>(context).add(
    //   OnUsuairoDetalle(user),
    // );
    // Navigator.pushNamed(context, "user_detalle_view");
  }
}
