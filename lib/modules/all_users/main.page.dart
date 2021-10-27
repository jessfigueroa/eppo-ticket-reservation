import 'package:eppo/modules/admin/user/__user.dart';
import 'package:eppo/modules/admin/user/bloc/user_bloc.dart';
import 'package:eppo/modules/all_users/consts.dart';
import 'package:eppo/modules/auth/bloc/auth_bloc.dart';
import 'package:eppo/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eppo/utils/utils.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    initEppoApp(context);
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        BlocProvider.of<UserBloc>(context)
            .add(OnCreateEditUser(state.currentUser!));
        return Scaffold(
          appBar: AppBar(
            backgroundColor: PRIMARY_COLOR_THEME,
            title: Text(TITLE),
          ),
          body: DetalleUserPage(isPerfil: true),
          drawer: CustomDrawerView(),
        );
      },
    );
  }
}
