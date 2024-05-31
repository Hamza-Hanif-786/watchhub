import "package:flutter/material.dart";
import "package:watchhub/common/widgets/brands/brand_show_case.dart";
import "package:watchhub/common/widgets/shimmers/boxes_shimmer.dart";
import "package:watchhub/common/widgets/shimmers/list_tile_shimmer.dart";
import "package:watchhub/features/shop/controllers/brand_controller.dart";
import "package:watchhub/features/shop/models/category_model.dart";
import "package:watchhub/utils/constants/sizes.dart";
import "package:watchhub/utils/helpers/cloud_helper_functions.dart";

class CategoryBrands extends StatelessWidget {
  const CategoryBrands({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;

    return FutureBuilder(
      future: controller.getBrandsForCategory(category.id),
      builder: (context, snapshot) {
        // Handle Loader, No Record, Error Message
        const loader = Column(
          children: [
            WHListTileShimmer(),
            SizedBox(height: WatchHubSizes.spaceBtwItems),
            WHBoxesShimmer(),
            SizedBox(height: WatchHubSizes.spaceBtwItems),
          ],
        );
        final widget = WHCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
        if (widget != null) return widget;

        // Brands Found
        final brands = snapshot.data!;
        
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: brands.length,
          itemBuilder: (_,index) {
            final brand = brands[index];
            return FutureBuilder(
              future: controller.getBrandProducts(brandId: brand.id, limit: 3),
              builder: (context, snapshot) {

                // Handle Loader, No Record, Error Message
                final widget = WHCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
                if (widget != null) return widget;

                // Records Found
                final products = snapshot.data!;

                return WHBrandShowcase(brand: brand, images: products.map((e) => e.thumbnail).toList());
              }
            );
          }
        );
      }
    );
  }
}