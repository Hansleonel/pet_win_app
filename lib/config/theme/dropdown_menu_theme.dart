import 'package:flutter/material.dart';

import 'constants/constants.dart';

DropdownMenuThemeData dropdownMenuThemeData = const DropdownMenuThemeData(
  textStyle: TextStyle(
    fontSize: 16,
    color: blackColor,
  ),
  inputDecorationTheme: InputDecorationTheme(
    fillColor: lightGreyColor,
    filled: true,
    hintStyle: TextStyle(color: greyColor),
    border: outlineInputBorder,
    enabledBorder: outlineInputBorder,
    focusedBorder: focusedOutlineInputBorder,
    errorBorder: errorOutlineInputBorder,
  ),
);

const OutlineInputBorder outlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(defaultBorderRadious)),
  borderSide: BorderSide(
    color: Colors.transparent,
  ),
);

const OutlineInputBorder focusedOutlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(defaultBorderRadious)),
  borderSide: BorderSide(color: primaryColor),
);

const OutlineInputBorder errorOutlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(defaultBorderRadious)),
  borderSide: BorderSide(
    color: errorColor,
  ),
);

OutlineInputBorder secodaryOutlineInputBorder(BuildContext context) {
  return OutlineInputBorder(
    borderRadius: const BorderRadius.all(Radius.circular(defaultBorderRadious)),
    borderSide: BorderSide(
      color: Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.15),
    ),
  );
}
