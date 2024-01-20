import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:watchhub/utils/constants/colors.dart';
import 'package:watchhub/utils/constants/sizes.dart';
import 'package:watchhub/utils/device/device_utility.dart';
import 'package:watchhub/utils/helpers/helper_functions.dart';

class WHAppBar extends StatelessWidget implements PreferredSizeWidget {
  const WHAppBar({
    super.key, 
    this.title, 
    this.showBackArrow = false, 
    this.leadingIcon, 
    this.actions, 
    this.leadingOnPressed
  });

  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;

  @override
  Widget build(BuildContext context) {
    final dark = WatchHubHelperFunctions.isDarkMode(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: WatchHubSizes.md),
      child: AppBar(
        automaticallyImplyLeading: false,
        leading: showBackArrow 
        ? IconButton(onPressed: () => Get.back(), icon: Icon(Iconsax.arrow_left, color: dark ? WatchHubColors.white : WatchHubColors.dark)) 
        : leadingIcon != null ? IconButton(onPressed: leadingOnPressed, icon: const Icon(Iconsax.arrow_left)) : null,
        title: title,
        actions: actions
      )
    );
  }
  
  @override

  Size get preferredSize => Size.fromHeight(WatchHubDeviceUtils.getAppBarHeight());

}