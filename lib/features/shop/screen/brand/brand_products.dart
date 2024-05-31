import 'package:flutter/material.dart';
import 'package:watchhub/common/widgets/appbar/appbar.dart';
import 'package:watchhub/common/widgets/brands/brand_card.dart';
import 'package:watchhub/common/widgets/products/sortable/sortable_products.dart';
import 'package:watchhub/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:watchhub/features/shop/controllers/brand_controller.dart';
import 'package:watchhub/features/shop/models/brand_model.dart';
import 'package:watchhub/utils/constants/sizes.dart';
import 'package:watchhub/utils/helpers/cloud_helper_functions.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key, required this.brand});

  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    
    return Scaffold(
      appBar: WHAppBar(title: Text(brand.name), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(WatchHubSizes.defaultSpace),
          child: Column(
            children: [
              // Brand Details
              WHBrandCard(showBorder: true, brand: brand),
              const SizedBox(height: WatchHubSizes.spaceBtwSections),

              FutureBuilder(
                future: controller.getBrandProducts(brandId: brand.id),
                builder: (context, snapshot) {

                  // Handle Loader, No Record or Error Message
                  const loader = WHVerticalProductShimmer();
                  final widget = WHCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
                  if (widget != null) return widget;

                  // Products Found
                  final brandProducts = snapshot.data!;

                  return WHSortableProducts(products: brandProducts);
                }
              )
            ]
          )
        )
      ),
    );
  }
}