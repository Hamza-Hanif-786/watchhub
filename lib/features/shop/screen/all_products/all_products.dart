import "package:flutter/material.dart";
import "package:watchhub/common/widgets/appbar/appbar.dart";
import "package:watchhub/common/widgets/products/sortable/sortable_products.dart";
import "package:watchhub/utils/constants/sizes.dart";

class AllProducts extends StatelessWidget {
  const AllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar:  WHAppBar(showBackArrow: true, title: Text("Popular Products")),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(WatchHubSizes.defaultSpace),
          child: WHSortableProducts(),
        )
      )
    );
  }
}

