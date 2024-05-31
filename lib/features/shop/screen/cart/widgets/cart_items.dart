import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watchhub/common/widgets/products/cart/add_remove_button.dart';
import 'package:watchhub/common/widgets/products/cart/cart_item.dart';
import 'package:watchhub/common/widgets/texts/product_price_text.dart';
import 'package:watchhub/features/shop/controllers/product/cart_controller.dart';
import 'package:watchhub/utils/constants/sizes.dart';

class WHCartItems extends StatelessWidget {
  const WHCartItems({
    super.key, 
    this.showAddRemoveButtons = true
  });

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;

    return Obx(
      () => ListView.separated(
        shrinkWrap: true,
        separatorBuilder: (_, __) => const SizedBox(height: WatchHubSizes.spaceBtwSections),
        itemCount: cartController.cartItems.length,
        itemBuilder: (_, index) => Obx( ()
          { final item = cartController.cartItems[index];
            return Column(
            children: [
              // Cart Item
              WHCartItem(cartItem: item),
              if(showAddRemoveButtons)const SizedBox(height: WatchHubSizes.spaceBtwItems),
                
              // Add remove buttons with total price
              if(showAddRemoveButtons)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      // Extra Space
                      const SizedBox(width: 70),
                
                      // Add remove Buttons
                      ProductQuantityWithAddRemoveButton(
                        quantity: item.quantity, 
                        add: () => cartController.addOneToCart(item),
                        remove: () => cartController.removeOneFromCart(item),
                      ),
                    ],
                  ),
                  WHProductPriceText(price: (item.price * item.quantity).toStringAsFixed(1))
                ],
              )
            ],
          );
        }),
      ),
    );
  }
}
