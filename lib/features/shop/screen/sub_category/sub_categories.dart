import "package:flutter/material.dart";
import "package:watchhub/common/widgets/appbar/appbar.dart";
import "package:watchhub/common/widgets/images/wh_rounded_image.dart";
import "package:watchhub/common/widgets/products/product_cards/product_cart_horizontal.dart";
import "package:watchhub/common/widgets/texts/section_heading.dart";
import "package:watchhub/utils/constants/image_strings.dart";
import "package:watchhub/utils/constants/sizes.dart";

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const WHAppBar(title: Text("Smart Watches"), showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(WatchHubSizes.defaultSpace),
          child: Column(
            children: [
              // Banner
              const WHRoundedImage(width: double.infinity, imageUrl: WatchHubImages.promoBanner2, applyImageRadius: true,),
              const SizedBox(height: WatchHubSizes.spaceBtwSections),

              // Sub-Categories
              Column(
                children: [
                  /// Heading
                  WHSectionHeading(title: "Smart Watches", showActionButton: true, onPressed: () {}),
                  const SizedBox(height: WatchHubSizes.spaceBtwItems / 2),

                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) => const SizedBox(width: WatchHubSizes.spaceBtwItems,),
                      itemBuilder: (context, index) => const WHProductCardHorizontal()
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}