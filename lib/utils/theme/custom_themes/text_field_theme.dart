import 'package:flutter/material.dart';
import 'package:watchhub/utils/constants/colors.dart';
import 'package:watchhub/utils/constants/sizes.dart';

class WatchHubTextFormFieldTheme {
  WatchHubTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: WatchHubColors.darkGrey,
    suffixIconColor: WatchHubColors.darkGrey,
    // constraints: const BoxConstraints.expand(height: WatchHubSizes.inputFieldHeight),
    labelStyle: const TextStyle().copyWith(fontSize: WatchHubSizes.fontSizeMd, color: WatchHubColors.black),
    hintStyle: const TextStyle().copyWith(fontSize: WatchHubSizes.fontSizeSm, color: WatchHubColors.black),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: const TextStyle().copyWith(color: WatchHubColors.black.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(WatchHubSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: WatchHubColors.grey)
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(WatchHubSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: WatchHubColors.grey)
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(WatchHubSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: WatchHubColors.dark)
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(WatchHubSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: WatchHubColors.warning)
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(WatchHubSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: WatchHubColors.warning)
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 2,
    prefixIconColor: WatchHubColors.darkGrey,
    suffixIconColor: WatchHubColors.darkGrey,
    // constraints: const BoxConstraints.expand(height: WatchHubSizes.inputFieldHeight),
    labelStyle: const TextStyle().copyWith(fontSize: WatchHubSizes.fontSizeMd, color: WatchHubColors.white),
    hintStyle: const TextStyle().copyWith(fontSize: WatchHubSizes.fontSizeSm, color: WatchHubColors.white),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: const TextStyle().copyWith(color: WatchHubColors.white.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(WatchHubSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: WatchHubColors.darkGrey)
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(WatchHubSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: WatchHubColors.darkGrey)
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(WatchHubSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: WatchHubColors.light)
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(WatchHubSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: WatchHubColors.warning)
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(WatchHubSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: WatchHubColors.warning)
    ),
  );
}