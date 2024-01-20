import 'package:flutter/material.dart';
import 'package:watchhub/common/widgets/products/cart/add_remove_button.dart';
import 'package:watchhub/common/widgets/products/cart/cart_item.dart';
import 'package:watchhub/common/widgets/texts/product_price_text.dart';
import 'package:watchhub/utils/constants/sizes.dart';

class WHCartItems extends StatelessWidget {
  const WHCartItems({
    super.key, 
    this.showAddRemoveButtons = true
  });

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_, __) => const SizedBox(height: WatchHubSizes.spaceBtwSections),
      itemCount: 2,
      itemBuilder: (_, index) => Column(
        children: [
          // Cart Item
          const WHCartItem(),
          if(showAddRemoveButtons)const SizedBox(height: WatchHubSizes.spaceBtwItems),

          // Add remove buttons with total price
          if(showAddRemoveButtons)
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  // Extra Space
                  SizedBox(width: 70),

                  // Add remove Buttons
                  ProductQuantityWithAddRemoveButton(),
                ],
              ),
              WHProductPriceText(price: "150")
            ],
          )
        ],
      ),
    );
  }
}
