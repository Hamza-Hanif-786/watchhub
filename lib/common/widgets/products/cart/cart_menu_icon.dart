import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:watchhub/features/shop/controllers/product/cart_controller.dart';
import 'package:watchhub/features/shop/screen/cart/cart.dart';
import 'package:watchhub/utils/constants/colors.dart';

class WHCartCounterIcon extends StatelessWidget {
  const WHCartCounterIcon({
    super.key, required this.iconColor,
  });

  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CartController());

    return Stack(
      children: [
        IconButton(onPressed: () => Get.to(() => const CartScreen()), icon: Icon(Iconsax.shopping_bag, color: iconColor)),
        Positioned(
          right: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: WatchHubColors.dark,
              borderRadius: BorderRadius.circular(100)
            ),
            child: Center(
              child: Obx(
                () => Text(
                  controller.noOfCartItems.value.toString(),
                  style: Theme.of(context).textTheme.labelLarge!.apply(color: WatchHubColors.white, fontSizeFactor: 0.8)
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

