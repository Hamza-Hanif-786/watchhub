import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:watchhub/common/widgets/layouts/grid_layout.dart';
import 'package:watchhub/common/widgets/products/product_cards/product_cart_vertical.dart';
import 'package:watchhub/features/shop/controllers/all_products_controller.dart';
import 'package:watchhub/features/shop/models/product_model.dart';
import 'package:watchhub/utils/constants/sizes.dart';

class WHSortableProducts extends StatelessWidget {
  const WHSortableProducts({
    super.key, 
    required this.products,
  });

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ALLProductsController());
    controller.assignProducts(products);

    return Column(
      children: [
        // Dropdown
        DropdownButtonFormField(
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          value: controller.selectedSortOption.value,
          onChanged: (value) {
            controller.sortProducts(value!);
          },
          items: ["Name", "Higher Price", "Lower Price", "Sale", "Newest", "Popularity"].map(
            (option) => DropdownMenuItem( value: option, child: Text(option))
          ).toList(), 
        ),
        const SizedBox(height: WatchHubSizes.spaceBtwItems),
    
        /// Products
        Obx(
          () => WHGridLayout(
            itemCount: controller.products.length, 
            itemBuilder: (_,index) => WHProductCardVertical(product: controller.products[index]),
          ),
        ),
      ],
    );
  }
}