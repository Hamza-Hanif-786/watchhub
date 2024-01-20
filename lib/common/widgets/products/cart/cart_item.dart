import 'package:flutter/material.dart';
import 'package:watchhub/common/widgets/images/wh_rounded_image.dart';
import 'package:watchhub/common/widgets/texts/product_title_text.dart';
import 'package:watchhub/common/widgets/texts/wh_brand_title_text_with_verified_icon.dart';
import 'package:watchhub/utils/constants/colors.dart';
import 'package:watchhub/utils/constants/image_strings.dart';
import 'package:watchhub/utils/constants/sizes.dart';
import 'package:watchhub/utils/helpers/helper_functions.dart';

class WHCartItem extends StatelessWidget {
  const WHCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = WatchHubHelperFunctions.isDarkMode(context);

    return Row(
      children: [
        /// Image
        WHRoundedImage(
          imageUrl: WatchHubImages.luxuryIcon,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(WatchHubSizes.sm),
          backgroundColor: dark ? WatchHubColors.darkerGrey : WatchHubColors.light,
        ),
        const SizedBox(width: WatchHubSizes.spaceBtwItems),
    
        /// Title, Price and Size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const WHBrandTitleWithVerifiedIcon(title: "Rolex"),
              const Flexible(child: WHProductTitleText(title: "Rolex Silver Chain Luxury Watch", maxLines: 1)),
              /// Attributes
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: "Color ", style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(text: "Silver ", style: Theme.of(context).textTheme.bodyLarge),
                    TextSpan(text: "Size ", style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(text: "Medium ", style: Theme.of(context).textTheme.bodyLarge),
                  ]
                )
              )
            ],
          ),
        )
      ],
    );
  }
}