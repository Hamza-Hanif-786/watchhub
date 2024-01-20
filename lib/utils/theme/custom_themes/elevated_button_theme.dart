import 'package:flutter/material.dart';
import 'package:watchhub/utils/constants/colors.dart';

class WatchHubElevatedButtonTheme {
  WatchHubElevatedButtonTheme._();

  static final ElevatedButtonThemeData lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: WatchHubColors.white,
      backgroundColor: WatchHubColors.primary,
      disabledForegroundColor: WatchHubColors.grey,
      disabledBackgroundColor: WatchHubColors.grey,
      side: const BorderSide(color: WatchHubColors.primary),
      padding: const EdgeInsets.symmetric(vertical: 18),
      textStyle: const TextStyle(fontSize: 16, color: WatchHubColors.white, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );


  static final ElevatedButtonThemeData darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: WatchHubColors.white,
      backgroundColor: WatchHubColors.primary,
      disabledForegroundColor: WatchHubColors.grey,
      disabledBackgroundColor: WatchHubColors.grey,
      side: const BorderSide(color: WatchHubColors.primary),
      padding: const EdgeInsets.symmetric(vertical: 18),
      textStyle: const TextStyle(fontSize: 16, color: WatchHubColors.white, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );
}