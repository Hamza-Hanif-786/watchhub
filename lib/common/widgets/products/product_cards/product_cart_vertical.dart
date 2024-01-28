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
import 'package:watchhub/features/shop/controllers/product/product_controller.dart';
import "package:watchhub/features/shop/models/product_model.dart";
import "package:watchhub/features/shop/screen/product_details/product_detail.dart";
import "package:watchhub/utils/constants/colors.dart";
import "package:watchhub/utils/constants/enums.dart";
import "package:watchhub/utils/constants/sizes.dart";
import "package:watchhub/utils/helpers/helper_functions.dart";

class WHProductCardVertical extends StatelessWidget {
  const WHProductCardVertical({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage = controller.calculateSalePercentage(product.price, product.salePrice);
    final dark = WatchHubHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailScreen(product: product), transition: Transition.rightToLeftWithFade),
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
              height: 170,
              width: 180,
              padding: const EdgeInsets.all(WatchHubSizes.sm),
              backgroundColor: dark ? WatchHubColors.dark : WatchHubColors.light,
              child: Stack(
                children: [
                  /// Thumbnail image
                  WHRoundedImage(imageUrl: product.thumbnail, applyImageRadius: true, isNetworkImage: true),
      
                  // Sale Tag
                  Positioned(
                    top: 12,
                    child: WHRoundedContainer(
                      radius: WatchHubSizes.sm,
                      backgroundColor: WatchHubColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(horizontal: WatchHubSizes.sm, vertical: WatchHubSizes.xs),
                      child: Text("$salePercentage%", style: Theme.of(context).textTheme.labelLarge!.apply(color: WatchHubColors.black)),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: WatchHubSizes.sm),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    WHProductTitleText(title: product.title, smallSize: true),
                    const SizedBox(height: WatchHubSizes.spaceBtwItems / 2),
                    WHBrandTitleWithVerifiedIcon(
                      title: product.brand!.name,
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
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if(product.productType == ProductType.single.toString() && product.salePrice > 0) 
                        Padding(
                          padding: const EdgeInsets.only(left: WatchHubSizes.xs),
                          child: Text(
                            "\$${product.price}",
                            style: Theme.of(context).textTheme.labelMedium!.apply(decoration: TextDecoration.lineThrough),
                          ),
                        ),
                  
                        Padding(
                          padding: const EdgeInsets.only(left: WatchHubSizes.xs),
                          child: WHProductPriceText(price: controller.getProductPrice(product)),
                        )
                    ],
                  ),
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
            ),
      
          ],
        ),
      ),
    );
  }
}

