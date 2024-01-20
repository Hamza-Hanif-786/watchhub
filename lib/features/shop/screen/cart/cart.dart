import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:watchhub/common/widgets/appbar/appbar.dart";
import "package:watchhub/features/shop/screen/cart/widgets/cart_items.dart";
import "package:watchhub/features/shop/screen/checkout/checkout.dart";
import "package:watchhub/utils/constants/sizes.dart";

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  WHAppBar(showBackArrow: true, title: Text("Cart", style: Theme.of(context).textTheme.headlineSmall)),

      body: const Padding(
        padding: EdgeInsets.all(WatchHubSizes.defaultSpace),
        child: WHCartItems(),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(WatchHubSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(() => const CheckoutScreen(), transition: Transition.rightToLeftWithFade), 
          child: const Text("Checkout \$600")
        ),
      ),
    );
  }
}

