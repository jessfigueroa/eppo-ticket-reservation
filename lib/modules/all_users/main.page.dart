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
        return Scaffold(
          appBar: AppBar(backgroundColor: PRIMARY_COLOR_THEME),
          body: Center(
            child: Text(
                'Hola ${state.currentUser?.name}- tu rol es : ${state.currentUser?.rol}'),
          ),
          drawer: CustomDrawerView(),
        );
      },
    );
  }
}
