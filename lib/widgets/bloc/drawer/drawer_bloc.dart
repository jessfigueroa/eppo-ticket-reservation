import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:eppo/widgets/models/models.dart';
import 'package:meta/meta.dart';

part 'drawer_event.dart';
part 'drawer_state.dart';

class DrawerBloc extends Bloc<DrawerEvent, DrawerState> {
  DrawerBloc() : super(DrawerState());

  @override
  Stream<DrawerState> mapEventToState(DrawerEvent event) async* {
    if (event is OnExpandItem) {
      final currentMenu = state.menu;
      currentMenu[event.index].expanded = !currentMenu[event.index].expanded;
      yield state.copyWith(menu: currentMenu);
    } else if (event is OnAddMenu) {
      yield state.copyWith(menu: event.menu);
    }
  }
}
