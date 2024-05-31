import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:iconsax/iconsax.dart";
import "package:watchhub/common/widgets/appbar/appbar.dart";
import "package:watchhub/common/widgets/icons/wh_circular_icon.dart";
import "package:watchhub/common/widgets/layouts/grid_layout.dart";
import "package:watchhub/common/widgets/loaders/animation_loader.dart";
import "package:watchhub/common/widgets/products/product_cards/product_cart_vertical.dart";
import "package:watchhub/common/widgets/shimmers/vertical_product_shimmer.dart";
import "package:watchhub/features/shop/controllers/product/favourites_controller.dart";
import "package:watchhub/navigation_menu.dart";
import "package:watchhub/utils/constants/image_strings.dart";
import "package:watchhub/utils/constants/sizes.dart";
import "package:watchhub/utils/helpers/cloud_helper_functions.dart";

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = FavouritesController.instance;
    return Scaffold(
      appBar: WHAppBar(
        title: Text("Wishlist", style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          WHCircularIcon(icon: Iconsax.add, onPressed: () => Get.offAll(() => const NavigationMenu(), transition: Transition.fade)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(WatchHubSizes.defaultSpace),

          child: Obx(
            () => FutureBuilder(
              future: controller.favoriteProducts(),
              builder: (context, snapshot) {
                // Nothing found widget
                final emptyWidget = WHAnimationLoaderWidget(
                  text: 'Whoops! Wishlist is Empty...',
                  animation: WatchHubImages.pencilAnimation,

                );
            
                const loader = WHVerticalProductShimmer(itemCount: 8);
                final widget = WHCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader, nothingFound: emptyWidget);
                if(widget != null) return widget; 
            
                final products = snapshot.data!;
            
                return WHGridLayout(
                  itemCount: products.length, 
                  itemBuilder: (_,index) => WHProductCardVertical(product: products[index]),
                );
              }
            ),
          ),
        ),
      ),
    );
  }
}