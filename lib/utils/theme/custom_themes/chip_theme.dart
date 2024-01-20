import 'package:flutter/material.dart';
import 'package:watchhub/utils/constants/colors.dart';

class WatchHubChipTheme {
  WatchHubChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: WatchHubColors.grey.withOpacity(0.4),
    labelStyle: const TextStyle(color: WatchHubColors.black),
    selectedColor: WatchHubColors.primary,
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
    checkmarkColor: WatchHubColors.white
  );

  static ChipThemeData darkChipTheme = const ChipThemeData(
    disabledColor: WatchHubColors.darkerGrey,
    labelStyle: TextStyle(color: WatchHubColors.white),
    selectedColor: WatchHubColors.primary,
    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
    checkmarkColor: WatchHubColors.white
  );
}