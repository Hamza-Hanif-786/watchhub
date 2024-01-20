import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:watchhub/common/widgets/icons/wh_circular_icon.dart';
import 'package:watchhub/utils/constants/colors.dart';
import 'package:watchhub/utils/constants/sizes.dart';
import 'package:watchhub/utils/helpers/helper_functions.dart';

class ProductQuantityWithAddRemoveButton extends StatelessWidget {
  const ProductQuantityWithAddRemoveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = WatchHubHelperFunctions.isDarkMode(context);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        WHCircularIcon(
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: WatchHubSizes.md, 
          onPressed: () {}, 
          color: dark ? WatchHubColors.white : WatchHubColors.black,
          backgroundColor: dark ? WatchHubColors.darkerGrey : WatchHubColors.light,
        ),
        const SizedBox(width: WatchHubSizes.spaceBtwItems),
        Text("2", style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(width: WatchHubSizes.spaceBtwItems),
        
        WHCircularIcon(
          icon: Iconsax.add,
          width: 32,
          height: 32,
          size: WatchHubSizes.md,
          onPressed: () {},
          color: WatchHubColors.white,
          backgroundColor: WatchHubColors.primary,
        )
      ],
    );
  }
}
