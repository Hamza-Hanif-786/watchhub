import 'package:flutter/material.dart';
import 'package:watchhub/utils/constants/colors.dart';

class WatchHubBottomSheetTheme {
  WatchHubBottomSheetTheme._();

  static BottomSheetThemeData lightBottomSheetTheme = BottomSheetThemeData(
    showDragHandle: true,
    backgroundColor: WatchHubColors.white,
    modalBackgroundColor: WatchHubColors.white,
    constraints: const BoxConstraints(minWidth: double.infinity),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))
  );

  static BottomSheetThemeData darkBottomSheetTheme = BottomSheetThemeData(
    showDragHandle: true,
    backgroundColor: WatchHubColors.black,
    modalBackgroundColor: WatchHubColors.black,
    constraints: const BoxConstraints(minWidth: double.infinity),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))
  );
}