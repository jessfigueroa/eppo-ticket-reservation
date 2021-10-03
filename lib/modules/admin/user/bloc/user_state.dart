part of 'user_bloc.dart';

@immutable
class UserState {
  final Stream<QuerySnapshot>? usersStream;
  final UserEppo? user;
  final FormSubmitState formSubmitState;
  final FormSubmitTypeState formSubmitTypeState;

  UserState(
      {this.usersStream,
      this.user,
      FormSubmitState? formSubmitState,
      FormSubmitTypeState? formSubmitTypeState})
      : formSubmitState = formSubmitState ?? NoSubmit(),
        formSubmitTypeState = formSubmitTypeState ?? NoType();

  UserState copyWith({
    Stream<QuerySnapshot>? usersStream,
    UserEppo? user,
    FormSubmitState? formSubmitState,
    FormSubmitTypeState? formSubmitTypeState,
  }) =>
      UserState(
        usersStream: usersStream ?? this.usersStream,
        user: user ?? this.user,
        formSubmitState: formSubmitState ?? this.formSubmitState,
        formSubmitTypeState: formSubmitTypeState ?? this.formSubmitTypeState,
      );
}
