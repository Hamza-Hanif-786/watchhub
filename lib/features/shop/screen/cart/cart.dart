import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:watchhub/common/widgets/appbar/appbar.dart";
import "package:watchhub/common/widgets/loaders/animation_loader.dart";
import "package:watchhub/features/shop/controllers/product/cart_controller.dart";
import "package:watchhub/features/shop/screen/cart/widgets/cart_items.dart";
import "package:watchhub/features/shop/screen/checkout/checkout.dart";
import "package:watchhub/utils/constants/image_strings.dart";
import "package:watchhub/utils/constants/sizes.dart";

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;

    return Scaffold(
      appBar:  WHAppBar(showBackArrow: true, title: Text("Cart", style: Theme.of(context).textTheme.headlineSmall)),

      body: Obx(() { 

        // Nothing Found Widget
        final emptyWidget = WHAnimationLoaderWidget(
          text: 'Whoops! Cart is Empty...',
          animation: WatchHubImages.cartAnimation,
        );

        if (controller.cartItems.isEmpty) {
          return emptyWidget;
        } else {
          return const SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(WatchHubSizes.defaultSpace), 
            
              child: WHCartItems(),
            ),
          );
        } 
      }),

      bottomNavigationBar: controller.cartItems.isEmpty ? const SizedBox() :  Padding(
        padding: const EdgeInsets.all(WatchHubSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(() => const CheckoutScreen(), transition: Transition.rightToLeftWithFade), 
          child: Obx(() => Text("Checkout \$${controller.totalCartPrice.value}"))
        ),
      ),
    );
  }
}

