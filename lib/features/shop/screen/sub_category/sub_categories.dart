import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:watchhub/common/widgets/appbar/appbar.dart";
import "package:watchhub/common/widgets/images/wh_rounded_image.dart";
import "package:watchhub/common/widgets/products/product_cards/product_cart_horizontal.dart";
import "package:watchhub/common/widgets/shimmers/horizontal_product_shimmer.dart";
import "package:watchhub/common/widgets/texts/section_heading.dart";
import "package:watchhub/features/shop/controllers/category_controller.dart";
import "package:watchhub/features/shop/models/category_model.dart";
import "package:watchhub/features/shop/screen/all_products/all_products.dart";
import "package:watchhub/utils/constants/image_strings.dart";
import "package:watchhub/utils/constants/sizes.dart";
import "package:watchhub/utils/helpers/cloud_helper_functions.dart";

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;

    return Scaffold(
      appBar: WHAppBar(title: Text(category.name), showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(WatchHubSizes.defaultSpace),
          child: Column(
            children: [
              // Banner
              const WHRoundedImage(width: double.infinity, imageUrl: WatchHubImages.promoBanner2, applyImageRadius: true,),
              const SizedBox(height: WatchHubSizes.spaceBtwSections),

              // Sub-Categories
              FutureBuilder(
                future: controller.getSubCategories(category.id),
                builder: (context, snapshot) {

                  // Handle Loader, No Record, Error Message
                  const loader = WHHorizontalProductShimmer();
                  final widget = WHCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
                  if (widget != null) return widget;

                  // Records Found
                  final subCategories = snapshot.data!;

                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: subCategories.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {

                      final subCategory = subCategories[index];

                       return FutureBuilder(
                         future: controller.getCategoryProducts(categoryId: subCategory.id),
                         builder: (context, snapshot) {

                          // Handle Loader, No Record, Error Message
                          final widget = WHCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
                          if (widget != null) return widget;

                          // Records Found
                          final products = snapshot.data!;

                          return Column(
                            children: [
                              /// Heading
                              WHSectionHeading(
                                title: subCategory.name, 
                                showActionButton: true, 
                                onPressed: () => Get.to(() => AllProducts(
                                  title: subCategory.name,
                                  futureMethod: controller.getCategoryProducts(categoryId: subCategory.id, limit: -1)
                                ))
                              ),
                              const SizedBox(height: WatchHubSizes.spaceBtwItems / 2),
                                                 
                              SizedBox(
                                height: 120,
                                child: ListView.separated(
                                  itemCount: products.length,
                                  scrollDirection: Axis.horizontal,
                                  separatorBuilder: (context, index) => const SizedBox(width: WatchHubSizes.spaceBtwItems,),
                                  itemBuilder: (context, index) => WHProductCardHorizontal(product: products[index]),
                                ),
                              ),

                              const SizedBox(height: WatchHubSizes.spaceBtwSections),
                            ],
                          );
                         }
                       );
                    }
                  );
                }
              )
            ],
          ),
        ),
      ),
    );
  }
}