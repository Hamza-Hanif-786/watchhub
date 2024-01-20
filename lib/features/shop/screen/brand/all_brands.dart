import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watchhub/common/widgets/appbar/appbar.dart';
import 'package:watchhub/common/widgets/brands/brand_card.dart';
import 'package:watchhub/common/widgets/layouts/grid_layout.dart';
import 'package:watchhub/common/widgets/texts/section_heading.dart';
import 'package:watchhub/features/shop/screen/brand/brand_products.dart';
import 'package:watchhub/utils/constants/sizes.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              WHGridLayout(
                itemCount: 6,
                mainAxisExtent: 80, 
                itemBuilder: (context, index) => WHBrandCard(
                  showBorder: true,
                  onTap: () => Get.to(() => const BrandProducts()),
                )
              )
            ]
          )
        ),
      ),
    );
  }
}