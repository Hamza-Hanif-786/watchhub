import 'package:flutter/material.dart';
import 'package:watchhub/common/widgets/appbar/appbar.dart';
import 'package:watchhub/common/widgets/brands/brand_card.dart';
import 'package:watchhub/common/widgets/products/sortable/sortable_products.dart';
import 'package:watchhub/utils/constants/sizes.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: WHAppBar(title: Text("Apple")),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(WatchHubSizes.defaultSpace),
          child: Column(
            children: [
              // Brand Details
              WHBrandCard(showBorder: true),
              SizedBox(height: WatchHubSizes.spaceBtwSections),

              WHSortableProducts()
            ]
          )
        )
      ),
    );
  }
}