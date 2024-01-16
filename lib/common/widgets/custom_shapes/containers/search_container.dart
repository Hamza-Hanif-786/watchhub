import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:watchhub/utils/constants/colors.dart';
import 'package:watchhub/utils/constants/sizes.dart';
import 'package:watchhub/utils/device/device_utility.dart';
import 'package:watchhub/utils/helpers/helper_functions.dart';

class WHSearchContainer extends StatelessWidget {
  const WHSearchContainer({
    super.key, 
    required this.text, 
    this.icon = Iconsax.search_normal, 
    this.showBackground = true, 
    this.showBorder = true, 
    this.onTap,
    this.padding = const EdgeInsets.symmetric(horizontal: WatchHubSizes.defaultSpace),
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final dark = WatchHubHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Container(
          width: WatchHubDeviceUtils.getScreenWidth(context),
          padding: const EdgeInsets.all(WatchHubSizes.md),
          decoration: BoxDecoration(
            color: showBackground ? dark ? WatchHubColors.dark : WatchHubColors.light : Colors.transparent,
            borderRadius: BorderRadius.circular(WatchHubSizes.cardRadiusLg),
            border: showBorder ? Border.all(color: WatchHubColors.grey) : null
          ),
          child: Row(
            children: [
              Icon(icon, color: WatchHubColors.grey),
              const SizedBox(width: WatchHubSizes.spaceBtwItems),
              Text(text, style: Theme.of(context).textTheme.bodySmall,)
            ],
          ),
        ),
      ),
    );
  }
}

