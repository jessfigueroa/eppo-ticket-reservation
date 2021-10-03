part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class OnSubscribeUsers extends UserEvent {}

class OnCreateEditUser extends UserEvent {
  final UserEppo user;
  OnCreateEditUser(this.user);
}

class OnSaveUser extends UserEvent {
  final UserEppo user;
  final FormSubmitTypeState formSubmitTypeState;
  OnSaveUser(this.user, this.formSubmitTypeState);
}
