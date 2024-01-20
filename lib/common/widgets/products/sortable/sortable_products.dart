import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:watchhub/common/widgets/layouts/grid_layout.dart';
import 'package:watchhub/common/widgets/products/product_cards/product_cart_vertical.dart';
import 'package:watchhub/utils/constants/sizes.dart';

class WHSortableProducts extends StatelessWidget {
  const WHSortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Dropdown
        DropdownButtonFormField(
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          onChanged: (value) {},
          items: ["Name", "Price", "Rating", "Popularity", "Date", "Discount"].map(
            (option) => DropdownMenuItem( value: option, child: Text(option))
          ).toList(), 
        ),
        const SizedBox(height: WatchHubSizes.spaceBtwItems),
    
        /// Products
        WHGridLayout(itemCount: 8, itemBuilder: (_,index) => const WHProductCardVertical()),
      ],
    );
  }
}