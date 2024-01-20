import 'package:flutter/material.dart';
import 'package:watchhub/utils/constants/colors.dart';
import 'custom_themes/appbar_theme.dart';
import 'custom_themes/bottom_sheet_theme.dart';
import 'custom_themes/checkbox_theme.dart';
import 'custom_themes/chip_theme.dart';
import 'custom_themes/elevated_button_theme.dart';
import 'custom_themes/outlined_button_theme.dart';
import 'custom_themes/text_field_theme.dart';
import 'custom_themes/text_theme.dart';

class WatchHubTheme {
  WatchHubTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    textTheme: WatchHubTextTheme.lightTextTheme,
    chipTheme: WatchHubChipTheme.lightChipTheme,
    scaffoldBackgroundColor: WatchHubColors.white,
    appBarTheme: WatchHubAppBarTheme.lightAppBarTheme,
    checkboxTheme: WatchHubCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: WatchHubBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: WatchHubElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: WatchHubOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: WatchHubTextFormFieldTheme.lightInputDecorationTheme
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    textTheme: WatchHubTextTheme.darkTextTheme,
    chipTheme: WatchHubChipTheme.darkChipTheme,
    scaffoldBackgroundColor: WatchHubColors.black,
    appBarTheme: WatchHubAppBarTheme.darkAppBarTheme,
    checkboxTheme: WatchHubCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: WatchHubBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: WatchHubElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: WatchHubOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: WatchHubTextFormFieldTheme.darkInputDecorationTheme
  );

}