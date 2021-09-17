import 'dart:async';

import 'package:eppo/models/user.model.dart';
import 'package:eppo/modules/auth/auth.service.dart';
import 'package:eppo/modules/auth/login/__login.dart';
import 'package:eppo/modules/auth/bloc/auth_submit_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthService authService = AuthService();
  AuthBloc() : super(AuthState());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is OnGoogleLogin) {
      yield* onGoogleLogin(event);
    } else if (event is OnLogout) {
      yield* onLogOut(event);
    } else if (event is OnEmailPassLogin) {
      yield* onEmailPassLogin(event);
    } else if (event is OnRegister) {
      yield* onRegister(event);
    }
  }

  Stream<AuthState> onRegister(OnRegister event) async* {
    final authResponse = await this.authService.createAccount(
          event.email,
          event.password,
        );
    yield state.copyWith(
      currentUser: authResponse.user,
      userIsLogin: authResponse.exito,
      statusLogin: !authResponse.exito
          ? ErrorLogin(authResponse.error)
          : SuccessfullLogin(),
    );
  }

  Stream<AuthState> onGoogleLogin(OnGoogleLogin event) async* {
    final authResponse = await authService.signInWithGoogle(
      isLogin: event.isLogin,
    );

    yield state.copyWith(
      currentUser: authResponse.user,
      userIsLogin: authResponse.exito,
      statusLogin: !authResponse.exito
          ? ErrorLogin(authResponse.error)
          : SuccessfullLogin(),
    );
  }

  Stream<AuthState> onEmailPassLogin(OnEmailPassLogin event) async* {
    final authResponse = await authService.signInWithEmailAndPassword(
      event.email,
      event.password,
    );
    yield state.copyWith(
      currentUser: authResponse.user,
      userIsLogin: authResponse.exito,
      statusLogin: !authResponse.exito
          ? ErrorLogin(authResponse.error)
          : SuccessfullLogin(),
    );
  }

  Stream<AuthState> onLogOut(OnLogout event) async* {
    authService.logOut();
    yield state.copyWith(userIsLogin: false);
  }
}
