import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:iconsax/iconsax.dart";
import "package:watchhub/common/widgets/icons/wh_circular_icon.dart";
import "package:watchhub/features/shop/controllers/product/favourites_controller.dart";
import "package:watchhub/utils/constants/colors.dart";

class WHFavouriteIcon extends StatelessWidget {
  const WHFavouriteIcon({super.key, required this.productId});

  final String productId;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavouritesController());

    return Obx(
      () => WHCircularIcon(
        icon: controller.isFavourite(productId) ? Iconsax.heart5 : Iconsax.heart,
        color: controller.isFavourite(productId) ? WatchHubColors.error : null,
        onPressed: () => controller.toggleFavoriteProduct(productId),
      )
    );
  }
}