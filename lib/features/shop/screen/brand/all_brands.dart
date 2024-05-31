import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watchhub/common/widgets/appbar/appbar.dart';
import 'package:watchhub/common/widgets/brands/brand_card.dart';
import 'package:watchhub/common/widgets/layouts/grid_layout.dart';
import 'package:watchhub/common/widgets/shimmers/brands_shimmer.dart';
import 'package:watchhub/common/widgets/texts/section_heading.dart';
import 'package:watchhub/features/shop/controllers/brand_controller.dart';
import 'package:watchhub/features/shop/screen/brand/brand_products.dart';
import 'package:watchhub/utils/constants/sizes.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = BrandController.instance;

    return Scaffold(
      appBar: const WHAppBar(title: Text("Brand"), showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(WatchHubSizes.defaultSpace),
          child: Column(
            children: [
              // Heading
              const WHSectionHeading(title: "Brands", showActionButton: false,),
              const SizedBox(height: WatchHubSizes.spaceBtwItems),

              /// Brands
              Obx(
                () {
                  if (brandController.isLoading.value) return const WHBrandsShimmer();
                  if (brandController.featuredBrands.isEmpty) {
                    return Center(
                      child: Text("No Data Found!", style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white)),
                    );
                  }
                  return WHGridLayout(
                    itemCount: brandController.allBrands.length,
                    mainAxisExtent: 80, 
                    itemBuilder: (_, index) {
                      final brand = brandController.allBrands[index];

                      return WHBrandCard(
                        showBorder: true, 
                        brand: brand,
                        onTap: () => Get.to(() => BrandProducts(brand: brand), transition: Transition.fadeIn),
                      );
                    }
                  );
                } 
              ),
            ]
          )
        ),
      ),
    );
  }
}