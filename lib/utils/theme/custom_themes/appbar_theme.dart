import 'package:flutter/material.dart';
import 'package:watchhub/utils/constants/colors.dart';
import 'package:watchhub/utils/constants/sizes.dart';

class WatchHubAppBarTheme {
  WatchHubAppBarTheme._();

  static const lightAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: WatchHubColors.black, size: WatchHubSizes.iconMd),
    actionsIconTheme: IconThemeData(color: WatchHubColors.black, size: WatchHubSizes.iconMd),
    titleTextStyle: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, color: WatchHubColors.black)
  );

  static const darkAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: WatchHubColors.black, size: WatchHubSizes.iconMd),
    actionsIconTheme: IconThemeData(color: WatchHubColors.white, size: WatchHubSizes.iconMd),
    titleTextStyle: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, color: WatchHubColors.white)
  );
}