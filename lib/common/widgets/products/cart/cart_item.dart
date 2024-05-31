import 'package:flutter/material.dart';
import 'package:watchhub/common/widgets/images/wh_rounded_image.dart';
import 'package:watchhub/common/widgets/texts/product_title_text.dart';
import 'package:watchhub/common/widgets/texts/wh_brand_title_text_with_verified_icon.dart';
import 'package:watchhub/features/shop/models/cart_item_model.dart';
import 'package:watchhub/utils/constants/colors.dart';
import 'package:watchhub/utils/constants/sizes.dart';
import 'package:watchhub/utils/helpers/helper_functions.dart';

class WHCartItem extends StatelessWidget {
  const WHCartItem({
    super.key,
    required this.cartItem
  });

  final CartItemModel cartItem;

  @override
  Widget build(BuildContext context) {
    final dark = WatchHubHelperFunctions.isDarkMode(context);

    return Row(
      children: [
        /// Image
        WHRoundedImage(
          isNetworkImage: true,
          imageUrl: cartItem.image ?? '',
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
              WHBrandTitleWithVerifiedIcon(title: cartItem.brandName ?? ''),
              Flexible(child: WHProductTitleText(title: cartItem.title, maxLines: 1)),
              /// Attributes
              Text.rich(
                TextSpan(
                  children: (cartItem.selectedVariation ?? {}).entries.map(
                    (e) => TextSpan(
                      children: [
                        TextSpan(text: "${e.key} ", style: Theme.of(context).textTheme.bodySmall),
                        TextSpan(text: "${e.value} ", style: Theme.of(context).textTheme.bodyLarge),
                      ],
                    ),
                  ).toList()
                )
              )
            ],
          ),
        )
      ],
    );
  }
}