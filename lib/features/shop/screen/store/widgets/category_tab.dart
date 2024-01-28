import "package:flutter/material.dart";
import "package:watchhub/common/widgets/brands/brand_show_case.dart";
import "package:watchhub/common/widgets/layouts/grid_layout.dart";
import "package:watchhub/common/widgets/products/product_cards/product_cart_vertical.dart";
import "package:watchhub/common/widgets/texts/section_heading.dart";
import "package:watchhub/features/shop/models/category_model.dart";
import "package:watchhub/features/shop/models/product_model.dart";
import "package:watchhub/utils/constants/image_strings.dart";
import "package:watchhub/utils/constants/sizes.dart";

class WHCategoryTab extends StatelessWidget {
  const WHCategoryTab({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(WatchHubSizes.defaultSpace),
          child: Column(
            children: [
              /// ---- Brands
              const WHBrandShowcase(images: [ WatchHubImages.smartIcon, WatchHubImages.smartIcon, WatchHubImages.smartIcon]),
              const WHBrandShowcase(images: [ WatchHubImages.fitnessIcon, WatchHubImages.fitnessIcon, WatchHubImages.fitnessIcon]),
              const SizedBox(height: WatchHubSizes.spaceBtwItems),

              /// ---- Products
              WHSectionHeading(title: 'You might like', showActionButton: true, onPressed: () {}),
              const SizedBox(height: WatchHubSizes.spaceBtwItems),

              WHGridLayout(itemCount: 4, itemBuilder: (_,index) => WHProductCardVertical(product: ProductModel.empty())),
              const SizedBox(height: WatchHubSizes.spaceBtwSections),

            ],
          ),
        ),
      ]
    ) ;
  }
}