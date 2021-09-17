part of 'auth_bloc.dart';

@immutable
class AuthState {
  final UserEppo? currentUser;
  final bool userIsLogin;
  final AuthSubmitState statusLogin;

  AuthState({
    this.currentUser,
    this.userIsLogin = false,
    AuthSubmitState? statusLogin,
  }) : this.statusLogin = statusLogin ?? NoLogin();

  AuthState copyWith({
    UserEppo? currentUser,
    bool? userIsLogin,
    AuthSubmitState? statusLogin,
  }) =>
      AuthState(
        currentUser: currentUser ?? this.currentUser,
        userIsLogin: userIsLogin ?? this.userIsLogin,
        statusLogin: statusLogin ?? this.statusLogin,
      );
}
