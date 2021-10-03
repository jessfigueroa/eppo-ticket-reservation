part of 'models.dart';

class ComboBoxModel {
  final String texto;
  final Widget? icon;
  final bool withIcon;
  final Function() onTap;
  final Color? color;
  final Color? iconBgColor;

  ComboBoxModel({
    required this.texto,
    this.icon,
    required this.onTap,
    this.color,
    this.iconBgColor,
    this.withIcon = true,
  });
}
