import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:iconsax/iconsax.dart";
import "package:watchhub/common/widgets/appbar/appbar.dart";
import "package:watchhub/common/widgets/icons/wh_circular_icon.dart";
import "package:watchhub/common/widgets/layouts/grid_layout.dart";
import "package:watchhub/common/widgets/products/product_cards/product_cart_vertical.dart";
import "package:watchhub/features/shop/models/product_model.dart";
import "package:watchhub/navigation_menu.dart";
import "package:watchhub/utils/constants/sizes.dart";

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WHAppBar(
        title: Text("Wishlist", style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          WHCircularIcon(icon: Iconsax.add, onPressed: () => Get.offAll(() => const NavigationMenu())),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(WatchHubSizes.defaultSpace),
          child: Column(
            children: [
              WHGridLayout(
                itemCount: 3, 
                itemBuilder: (_,index) => WHProductCardVertical(product: ProductModel.empty()),
              )
            ],
          ),
        ),
      ),
    );
  }
}