import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:watchhub/common/widgets/appbar/appbar.dart";
import "package:watchhub/common/widgets/products/sortable/sortable_products.dart";
import "package:watchhub/common/widgets/shimmers/vertical_product_shimmer.dart";
import "package:watchhub/features/shop/controllers/all_products_controller.dart";
import "package:watchhub/features/shop/models/product_model.dart";
import "package:watchhub/utils/constants/sizes.dart";
import "package:watchhub/utils/helpers/cloud_helper_functions.dart";

class AllProducts extends StatelessWidget {
  const AllProducts({super.key, required this.title, this.query, this.futureMethod});

  final String title;
  final Query? query;
  final Future<List<ProductModel>>? futureMethod;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ALLProductsController());
    
    return Scaffold(
      appBar:  WHAppBar(showBackArrow: true, title: Text(title)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(WatchHubSizes.defaultSpace),
          child: FutureBuilder(
            future: futureMethod ?? controller.fetchProductsByQuery(query),
            builder: (context, snapshot) {
              // Check the state of the FutureBuilder snapshot
              const loader = WHVerticalProductShimmer();
              final widget = WHCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);

              if(widget != null) return widget;

              // Products Found
              final products = snapshot.data!;

              return WHSortableProducts(products: products);
            }
          ),
        )
      )
    );
  }
}

