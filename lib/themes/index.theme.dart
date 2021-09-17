import 'package:eppo/enums/enum.dart';
import 'package:eppo/utils/utils.dart';
import 'package:flutter/material.dart';

getThemeData(DataThemeType type) {
  switch (type) {
    case DataThemeType.DARK:
      return getDarkTheme();
    case DataThemeType.LIGTH:
      return getLigthTheme();
    default:
  }
}

getLigthTheme() {
  return ThemeData.light().copyWith(primaryColor: PRIMARY_COLOR_THEME);
}

getDarkTheme() {
  return ThemeData.dark().copyWith();
}
