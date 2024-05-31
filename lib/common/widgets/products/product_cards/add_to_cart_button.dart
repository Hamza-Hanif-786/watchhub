import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:iconsax/iconsax.dart";
import "package:watchhub/features/shop/controllers/product/cart_controller.dart";
import "package:watchhub/features/shop/models/product_model.dart";
import "package:watchhub/features/shop/screen/product_details/product_detail.dart";
import "package:watchhub/utils/constants/colors.dart";
import "package:watchhub/utils/constants/enums.dart";
import "package:watchhub/utils/constants/sizes.dart";

class ProductCardAddToCartButton extends StatelessWidget {
  const ProductCardAddToCartButton({super.key, required this.product});

  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;

    return InkWell(
      onTap: () {
        if(product.productType == ProductType.single.toString()) {
          final cartItem = cartController.convertToCartItem(product, 1);
          cartController.addOneToCart(cartItem);
        } else {
          Get.to(() => ProductDetailScreen(product: product), transition: Transition.rightToLeftWithFade);
        }
      },
      child: Obx(
        () { 
          final productQuantityInCart = cartController.getProductQuantityInCart(product.id);
            return Container(
            decoration: BoxDecoration(
              color: productQuantityInCart > 0 ? WatchHubColors.primary : WatchHubColors.dark,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(WatchHubSizes.cardRadiusMd),
                bottomRight:Radius.circular(WatchHubSizes.productImageRadius)
              )
            ),
            child: SizedBox(
              width: WatchHubSizes.iconLg * 1.2,
              height: WatchHubSizes.iconLg * 1.2,
              child: Center(
                child: productQuantityInCart > 0
                ? Text(productQuantityInCart.toString(), style: Theme.of(context).textTheme.bodyLarge!.apply(color: WatchHubColors.white))
                : const Icon(Iconsax.add, color: WatchHubColors.white)
              ),
            ),
          );
        }
      ),
    );
  }
}
