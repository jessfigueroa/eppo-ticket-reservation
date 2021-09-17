part of 'drawer_bloc.dart';

@immutable
abstract class DrawerEvent {}

class OnExpandItem extends DrawerEvent {
  final int index;
  OnExpandItem(this.index);
}

class OnAddMenu extends DrawerEvent {
  final List<Menu> menu;
  OnAddMenu(this.menu);
}
