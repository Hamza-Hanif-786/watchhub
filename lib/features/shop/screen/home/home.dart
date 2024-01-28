import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watchhub/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:watchhub/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:watchhub/common/widgets/layouts/grid_layout.dart';
import 'package:watchhub/common/widgets/products/product_cards/product_cart_vertical.dart';
import 'package:watchhub/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:watchhub/common/widgets/texts/section_heading.dart';
import 'package:watchhub/features/shop/controllers/product/product_controller.dart';
import 'package:watchhub/features/shop/screen/all_products/all_products.dart';
import 'package:watchhub/features/shop/screen/home/widgets/home_appbar.dart';
import 'package:watchhub/features/shop/screen/home/widgets/home_categories.dart';
import 'package:watchhub/features/shop/screen/home/widgets/promo_slider.dart';
import 'package:watchhub/utils/constants/sizes.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [

            // Header
            const WHPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// Appbar
                  WHHomeAppBar(),
                  SizedBox(height: WatchHubSizes.spaceBtwSections),

                  /// Search Bar
                  WHSearchContainer(text: 'Search in Store'),
                  SizedBox(height: WatchHubSizes.spaceBtwSections),

                  /// Categories
                  Padding(
                    padding: EdgeInsets.only(left: WatchHubSizes.defaultSpace),
                    child: Column(
                      children: [

                        /// Heading
                        WHSectionHeading(title: 'Popular Categories', showActionButton: false, textColor: Colors.white,),
                        SizedBox(height: WatchHubSizes.spaceBtwItems),

                        /// Categories
                        WHHomeCategories(),

                      ],
                    ),
                  ),
                  SizedBox(height: WatchHubSizes.spaceBtwSections,)
                ],
              ),
            ),

            // Body
            Padding(
              padding: const EdgeInsets.all(WatchHubSizes.defaultSpace),
              child: Column(
                children: [
                  /// ---- Promo Slider
                  const WHPromoSlider(),
                  const SizedBox(height: WatchHubSizes.spaceBtwSections),

                  /// -- Heading
                  WHSectionHeading(
                    title: "Popular Products", 
                    showActionButton: true,
                    onPressed: () => Get.to(() => AllProducts(
                      title: 'Popular Products',
                      futureMethod: controller.fetchAllFeaturedProducts(),
                    )), 
                  ),
                  const SizedBox(height: WatchHubSizes.spaceBtwItems),

                  /// ---- Popular Products
                  
                  Obx(
                    () {
                      if(controller.isLoading.value) return const WHVerticalProductShimmer();
                      if(controller.featuredProducts.isEmpty) {
                        return Center(child: Text("No Data Found!", style: Theme.of(context).textTheme.bodyMedium));
                      } else {
                        return WHGridLayout(
                          itemCount: controller.featuredProducts.length, 
                          itemBuilder: (_ , index) =>  WHProductCardVertical(product: controller.featuredProducts[index]),
                        );
                      }
                    }
                  ),
                ],
              )
            )
          ],
        )
      ),
    );
  }
}


