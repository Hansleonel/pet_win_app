import 'package:flutter/material.dart';
import 'package:pet_app_win/config/theme/dropdown_menu_theme.dart';

import 'button_theme.dart';
import 'checkbox_theme.dart';
import 'constants/constants.dart';
import 'elements_theme.dart';
import 'input_decoration_theme.dart';

ThemeData lightTheme(BuildContext context) {
  return ThemeData(
    brightness: Brightness.light,
    fontFamily: "Plus Jakarta",
    primarySwatch: primaryMaterialColor,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: Colors.white,
    iconTheme: const IconThemeData(color: blackColor),
    textTheme: const TextTheme(bodyMedium: TextStyle(color: blackColor40)),
    elevatedButtonTheme: elevatedButtonThemeData,
    outlinedButtonTheme: outlinedButtonTheme(),
    textButtonTheme: textButtonThemeData,
    inputDecorationTheme: lightInputDecorationTheme,
    checkboxTheme:
        checkboxThemeData.copyWith(side: const BorderSide(color: blackColor40)),
    appBarTheme: appBarLightTheme,
    scrollbarTheme: scrollbarThemeData,
    dataTableTheme: dataTableLightThemeData,
    // TODO posible refactor here because the theme
    dropdownMenuTheme: dropdownMenuThemeData,
  );
}
