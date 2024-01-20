import 'package:flutter/material.dart';
import 'package:watchhub/utils/constants/colors.dart';
import 'package:watchhub/utils/device/device_utility.dart';
import 'package:watchhub/utils/helpers/helper_functions.dart';

class WHTabBar extends StatelessWidget implements PreferredSizeWidget {
  const WHTabBar({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final dark = WatchHubHelperFunctions.isDarkMode(context);
    return Material(
      color: dark ? WatchHubColors.black : WatchHubColors.white,
      child: TabBar(
        tabs: tabs,
        isScrollable: true,
        indicatorColor: WatchHubColors.primary,
        labelColor: dark ? WatchHubColors.white : WatchHubColors.primary,
        unselectedLabelColor: WatchHubColors.grey,
      ),
    );
  }
  
  @override
  Size get preferredSize => Size.fromHeight(WatchHubDeviceUtils.getAppBarHeight());
}