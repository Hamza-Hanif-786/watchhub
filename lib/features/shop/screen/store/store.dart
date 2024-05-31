import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:watchhub/common/widgets/appbar/appbar.dart";
import "package:watchhub/common/widgets/appbar/tabbar.dart";
import "package:watchhub/common/widgets/brands/brand_card.dart";
import "package:watchhub/common/widgets/custom_shapes/containers/search_container.dart";
import "package:watchhub/common/widgets/layouts/grid_layout.dart";
import "package:watchhub/common/widgets/products/cart/cart_menu_icon.dart";
import "package:watchhub/common/widgets/shimmers/brands_shimmer.dart";
import "package:watchhub/common/widgets/texts/section_heading.dart";
import "package:watchhub/features/shop/controllers/brand_controller.dart";
import "package:watchhub/features/shop/controllers/category_controller.dart";
import "package:watchhub/features/shop/screen/brand/all_brands.dart";
import "package:watchhub/features/shop/screen/brand/brand_products.dart";
import "package:watchhub/features/shop/screen/store/widgets/category_tab.dart";
import "package:watchhub/utils/constants/colors.dart";
import "package:watchhub/utils/constants/sizes.dart";
import "package:watchhub/utils/helpers/helper_functions.dart";

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = WatchHubHelperFunctions.isDarkMode(context);
    final categories = CategoryController.instance.featuredCategories;
    final brandcontroller = Get.put(BrandController());

    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: WHAppBar(
          title: Text("Store", style: Theme.of(context).textTheme.headlineMedium),
          actions: [
            WHCartCounterIcon( 
              iconColor: dark ? WatchHubColors.white : WatchHubColors.black
            )
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                pinned: true,
                floating: true,
                backgroundColor: dark ? WatchHubColors.black : WatchHubColors.white,
                expandedHeight: 440,
                automaticallyImplyLeading: false,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(WatchHubSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      /// ---- Search Bar
                      const SizedBox(height: WatchHubSizes.spaceBtwItems),
                      const WHSearchContainer(text: 'Search in Store', showBorder: true, showBackground: false, padding: EdgeInsets.zero),
                      const SizedBox(height: WatchHubSizes.spaceBtwSections),
      
                      /// ---- Featured Brands
                      WHSectionHeading(title: 'Featured Brands', onPressed: () => Get.to(() => const AllBrandsScreen(), transition: Transition.fadeIn),),
                      const SizedBox(height: WatchHubSizes.spaceBtwItems / 1.5),
      
                      Obx(
                        () {
                          if (brandcontroller.isLoading.value) return const WHBrandsShimmer();
                          if (brandcontroller.featuredBrands.isEmpty) {
                            return Center(
                              child: Text("No Data Found!", style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white)),
                            );
                          }
                          return WHGridLayout(
                            itemCount: brandcontroller.featuredBrands.length,
                            mainAxisExtent: 80, 
                            itemBuilder: (_, index) {
                              final brand = brandcontroller.featuredBrands[index];

                              return WHBrandCard(
                                showBorder: true, 
                                brand: brand,
                                onTap: () => Get.to(() => BrandProducts(brand: brand), transition: Transition.fadeIn),
                              );
                            }
                          );
                        } 
                      ),
                    ],
                  ),
                ),
      
                /// ---- Tabs
                bottom: WHTabBar(
                  tabs: categories.map((category) => Tab(child: Text(category.name))).toList(),
                ),
              )
            ];
          },

          /// ---- Body
          body: TabBarView(
            children: categories.map((category) => WHCategoryTab(category: category)).toList(),
          )
        )
      ),
    );
  }
}

