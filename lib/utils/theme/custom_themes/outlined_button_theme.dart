import 'package:flutter/material.dart';
import 'package:watchhub/utils/constants/colors.dart';

class WatchHubOutlinedButtonTheme {
  WatchHubOutlinedButtonTheme._();

  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: WatchHubColors.black,
      side: const BorderSide(color: WatchHubColors.primary),
      textStyle: const TextStyle(fontSize: 16, color: WatchHubColors.black, fontWeight: FontWeight.w600),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
    )
  );

  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: WatchHubColors.white,
      side: const BorderSide(color: WatchHubColors.primary),
      textStyle: const TextStyle(fontSize: 16, color: WatchHubColors.white, fontWeight: FontWeight.w600),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
    )
  );
}