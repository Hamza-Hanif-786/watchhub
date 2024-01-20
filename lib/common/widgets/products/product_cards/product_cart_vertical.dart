import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:iconsax/iconsax.dart";
import "package:watchhub/common/styles/shadows.dart";
import "package:watchhub/common/widgets/custom_shapes/containers/rounded_container.dart";
import "package:watchhub/common/widgets/icons/wh_circular_icon.dart";
import "package:watchhub/common/widgets/images/wh_rounded_image.dart";
import "package:watchhub/common/widgets/texts/product_price_text.dart";
import "package:watchhub/common/widgets/texts/product_title_text.dart";
import "package:watchhub/common/widgets/texts/wh_brand_title_text_with_verified_icon.dart";
import "package:watchhub/features/shop/screen/product_details/product_detail.dart";
import "package:watchhub/utils/constants/colors.dart";
import "package:watchhub/utils/constants/enums.dart";
import "package:watchhub/utils/constants/image_strings.dart";
import "package:watchhub/utils/constants/sizes.dart";
import "package:watchhub/utils/helpers/helper_functions.dart";

class WHProductCardVertical extends StatelessWidget {
  const WHProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = WatchHubHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () => Get.to(() => const ProductDetailScreen(), transition: Transition.rightToLeftWithFade),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [WHShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(WatchHubSizes.productImageRadius),
          color: dark ? WatchHubColors.darkerGrey : WatchHubColors.white
        ),
        child: Column(
          children: [
      
            /// Thumbnail, Wishlist Button, Discount Tag
            WHRoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(WatchHubSizes.sm),
              backgroundColor: dark ? WatchHubColors.dark : WatchHubColors.light,
              child: Stack(
                children: [
                  /// Thumbnail image
                  const WHRoundedImage(imageUrl: WatchHubImages.smartIcon, applyImageRadius: true),
      
                  // Sale Tag
                  Positioned(
                    top: 12,
                    child: WHRoundedContainer(
                      radius: WatchHubSizes.sm,
                      backgroundColor: WatchHubColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(horizontal: WatchHubSizes.sm, vertical: WatchHubSizes.xs),
                      child: Text("25%", style: Theme.of(context).textTheme.labelLarge!.apply(color: WatchHubColors.black)),
                    ),
                  ),
      
                  // Wishlist icon button
                  const Positioned(
                    top: 0,
                    right: 0,
                    child: WHCircularIcon(
                      icon: Iconsax.heart5,
                      color: Colors.red,
                    ),
                  ),
      
                ]
              ),
            ),
            const SizedBox(height: WatchHubSizes.spaceBtwItems / 2),
      
            /// ------ Details
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: WatchHubSizes.sm),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    WHProductTitleText(title: 'Smart Watch', smallSize: false),
                    SizedBox(height: WatchHubSizes.spaceBtwItems / 2),
                    WHBrandTitleWithVerifiedIcon(
                      title: 'Apple',
                      brandTextSize: TextSizes.medium,
                    )
                  ],
                ),
              ),
            ),

            const Spacer(),

            /// ------ Price, Add to cart
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Price
                const Padding(
                  padding: EdgeInsets.only(left: WatchHubSizes.sm),
                  child: WHProductPriceText(price: '35.0'),
                ),

                // Add to cart button
                Container(
                  decoration: const BoxDecoration(
                    color: WatchHubColors.dark,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(WatchHubSizes.cardRadiusMd),
                      bottomRight: Radius.circular(WatchHubSizes.productImageRadius)
                    )
                  ),
                  child: const SizedBox(
                    width: WatchHubSizes.iconLg * 1.2,
                    height: WatchHubSizes.iconLg * 1.2,
                    child: Center(child: Icon(Iconsax.add, color: WatchHubColors.white)),
                  ),
                )
              ]
            )
      
          ],
        ),
      ),
    );
  }
}

