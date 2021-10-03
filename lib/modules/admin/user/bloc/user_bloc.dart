import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eppo/models/user.model.dart';
import 'package:eppo/modules/admin/user/user.service.dart';
import 'package:eppo/states/form_submit_state.dart';
import 'package:eppo/states/submit_type.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final userService = UserService();
  UserBloc() : super(UserState());

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is OnSubscribeUsers) {
      yield* _onSunscribeUsers(event);
    } else if (event is OnCreateEditUser) {
      yield* _onCreateEditUser(event);
    } else if (event is OnSaveUser) {
      yield* _onSaveUser(event);
    }
  }

  Stream<UserState> _onSunscribeUsers(OnSubscribeUsers event) async* {
    yield state.copyWith(usersStream: userService.users);
  }

  Stream<UserState> _onCreateEditUser(OnCreateEditUser event) async* {
    yield state.copyWith(user: event.user);
  }

  Stream<UserState> _onSaveUser(OnSaveUser event) async* {
    yield state.copyWith(
      formSubmitState: Submitting(),
      formSubmitTypeState: event.formSubmitTypeState,
    );
    await userService.save(event.user);
    yield state.copyWith(formSubmitState: SuccessSubmit());
  }
}
