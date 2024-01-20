import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:iconsax/iconsax.dart";
import "package:watchhub/common/widgets/texts/section_heading.dart";
import "package:watchhub/features/shop/screen/product_details/widgets/bottom_add_to_cart_widget.dart";
import "package:watchhub/features/shop/screen/product_details/widgets/product_attributes.dart";
import "package:watchhub/features/shop/screen/product_details/widgets/product_detail_image_slider.dart";
import "package:watchhub/features/shop/screen/product_details/widgets/product_meta_data.dart";
import "package:watchhub/features/shop/screen/product_details/widgets/rating_share_widget.dart";
import "package:watchhub/features/shop/screen/product_reviews/product_reviews.dart";
import "package:watchhub/utils/constants/sizes.dart";
import 'package:readmore/readmore.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      bottomNavigationBar: const WHBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// --- Product Image Slider
            const WHProductImageSlider(),

            /// --- Product Details
            Padding(
              padding: const EdgeInsets.only(
                right: WatchHubSizes.defaultSpace,
                left: WatchHubSizes.defaultSpace,
                bottom: WatchHubSizes.defaultSpace
              ),
              child: Column(
                children: [
                  /// -- Rating & Share Button
                  const WHRatingAndShare(),

                  /// -- Price, Title, Stock & Brand
                  const WHProductMetaData(), 
                  
                  /// -- Attributes
                  const ProductAttributes(),
                  const SizedBox(height: WatchHubSizes.spaceBtwSections),
                  
                  /// -- Checkout Button
                  SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () {}, child: const Text("Checkout"))),
                  const SizedBox(height: WatchHubSizes.spaceBtwSections),

                  /// -- Description
                  const WHSectionHeading(title: "Description", showActionButton: false,),
                  const SizedBox(height: WatchHubSizes.spaceBtwItems),
                  const ReadMoreText("This is a Product description for white belt Apple Smart Watch. There is more things that can be added but i am just practicing and nothing less",
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: ' Show more',
                  trimExpandedText: ' Less',
                  moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),
                   
                  /// -- Reviews
                  const Divider(),
                  const SizedBox(height: WatchHubSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const WHSectionHeading(title: "Reviews(199)", showActionButton: false),
                      IconButton(
                        icon: const Icon(Iconsax.arrow_right_3, size: 18), 
                        onPressed: () => Get.to(() => const ProductReviewsScreen(), transition: Transition.rightToLeftWithFade)
                      ),
                    ],
                  ),
                  const SizedBox(height: WatchHubSizes.spaceBtwSections),
                ],
              ),
            )
          ]
        ),
      ),
    );
  }
}
