import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:watchhub/common/widgets/layouts/grid_layout.dart";
import "package:watchhub/common/widgets/products/product_cards/product_cart_vertical.dart";
import "package:watchhub/common/widgets/shimmers/vertical_product_shimmer.dart";
import "package:watchhub/common/widgets/texts/section_heading.dart";
import "package:watchhub/features/shop/controllers/category_controller.dart";
import "package:watchhub/features/shop/models/category_model.dart";
import "package:watchhub/features/shop/screen/all_products/all_products.dart";
import "package:watchhub/features/shop/screen/store/widgets/category_brands.dart";
import "package:watchhub/utils/constants/sizes.dart";
import "package:watchhub/utils/helpers/cloud_helper_functions.dart";

class WHCategoryTab extends StatelessWidget {
  const WHCategoryTab({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;

    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(WatchHubSizes.defaultSpace),
          child: Column(
            children: [
              /// ---- Brands
              CategoryBrands(category: category),
              const SizedBox(height: WatchHubSizes.spaceBtwItems),

              /// ---- Products
              FutureBuilder(
                future: controller.getCategoryProducts(categoryId: category.id),
                builder: (context, snapshot) {

                  // Handle Loader, No Record, Error Message
                  final response = WHCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, 
                  loader: const WHVerticalProductShimmer(itemCount: 10));
                  if (response != null) return response;

                  // Products Found
                  final products = snapshot.data!;

                  return Column(
                    children: [
                      WHSectionHeading(
                        title: 'You might like', 
                        showActionButton: true, 
                        onPressed: () => Get.to(() => AllProducts(
                          title: category.name,
                          futureMethod: controller.getCategoryProducts(categoryId: category.id, limit: -1),
                        ))
                      ),
                      const SizedBox(height: WatchHubSizes.spaceBtwItems),
                  
                      
                        WHGridLayout(
                          itemCount: products.length, 
                          itemBuilder: (_,index) => WHProductCardVertical(product: products[index])
                        ),
                      const SizedBox(height: WatchHubSizes.spaceBtwSections),
                    ],
                  );
                }
              ),
            ],
          ),
        ),
      ]
    ) ;
  }
}