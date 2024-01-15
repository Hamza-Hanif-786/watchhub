import 'package:flutter/material.dart';
import 'package:watchhub/utils/constants/colors.dart';

class WHShadowStyle {

  static final verticalProductShadow = BoxShadow(
    color: WatchHubColors.darkGrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2),
  );

  static final horizontalProductShadow = BoxShadow(
    color: WatchHubColors.darkGrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2),
  );
}