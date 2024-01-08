import "package:flutter/material.dart";
import "package:watchhub/utils/constants/sizes.dart";

class WatchHubSpacingStyles {
  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
    top: WatchHubSizes.appBarHeight,
    left: WatchHubSizes.defaultSpace,
    right: WatchHubSizes.defaultSpace,
    bottom: WatchHubSizes.defaultSpace
  );
}