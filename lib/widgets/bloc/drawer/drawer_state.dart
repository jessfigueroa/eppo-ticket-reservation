part of 'drawer_bloc.dart';

@immutable
class DrawerState {
  final List<Menu> menu;
  DrawerState({List<Menu>? menu}) : menu = menu ?? [];
  DrawerState copyWith({List<Menu>? menu}) =>
      DrawerState(menu: menu ?? this.menu);
}
