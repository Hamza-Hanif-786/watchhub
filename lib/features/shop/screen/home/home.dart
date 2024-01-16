import 'package:flutter/material.dart';
import 'package:watchhub/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:watchhub/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:watchhub/common/widgets/layouts/grid_layout.dart';
import 'package:watchhub/common/widgets/products/product_cards/product_cart_vertical.dart';
import 'package:watchhub/common/widgets/texts/section_heading.dart';
import 'package:watchhub/features/shop/screen/home/widgets/home_appbar.dart';
import 'package:watchhub/features/shop/screen/home/widgets/home_categories.dart';
import 'package:watchhub/features/shop/screen/home/widgets/promo_slider.dart';
import 'package:watchhub/utils/constants/image_strings.dart';
import 'package:watchhub/utils/constants/sizes.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                        WHSectionHeading(title: 'Popular Categories', showActionButton: true, textColor: Colors.white,),
                        SizedBox(height: WatchHubSizes.spaceBtwItems),

                        /// Categories
                        WHHomeCategories(),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Body
            Padding(
              padding: const EdgeInsets.all(WatchHubSizes.defaultSpace),
              child: Column(
                children: [
                  /// ---- Promo Slider
                  const WHPromoSlider(
                    banners: [
                      WatchHubImages.promoBanner1,
                      WatchHubImages.promoBanner2,
                      WatchHubImages.promoBanner3
                    ]
                  ),

                  const SizedBox(height: WatchHubSizes.spaceBtwSections),

                  /// ---- Popular Products
                  WHGridLayout(itemCount: 6, itemBuilder: (_ , index) =>  const WHProductCardVertical()),
                ],
              )
            )
          ],
        )
      ),
    );
  }
}


