import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:watchhub/common/widgets/icons/wh_circular_icon.dart';
import 'package:watchhub/utils/constants/colors.dart';
import 'package:watchhub/utils/helpers/helper_functions.dart';
import "package:watchhub/utils/constants/sizes.dart";

class WHBottomAddToCart extends StatelessWidget {
  const WHBottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = WatchHubHelperFunctions.isDarkMode(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: WatchHubSizes.defaultSpace, vertical: WatchHubSizes.defaultSpace / 2),
      decoration: BoxDecoration(
        color: dark ? WatchHubColors.darkerGrey : WatchHubColors.light,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(WatchHubSizes.cardRadiusLg),
          topRight: Radius.circular(WatchHubSizes.cardRadiusLg),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              WHCircularIcon(
                icon: Iconsax.minus,
                backgroundColor: WatchHubColors.darkGrey,
                width: 40,
                height: 40,
                onPressed: () {},
                color: WatchHubColors.white,
              ),
              const SizedBox(width: WatchHubSizes.spaceBtwItems),
              Text("2", style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(width: WatchHubSizes.spaceBtwItems),
              WHCircularIcon(
                icon: Iconsax.add,
                backgroundColor: WatchHubColors.black,
                width: 40,
                height: 40,
                onPressed: () {},
                color: WatchHubColors.white,
              )
            ]
          ),

          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(WatchHubSizes.md),
              backgroundColor: WatchHubColors.black,
              side: const BorderSide(color: WatchHubColors.black)
            ), 
            child: const Text("Add to Cart")
          )
        ]
      ),
    );
  }
}