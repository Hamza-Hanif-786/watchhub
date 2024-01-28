import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import "package:get/get.dart";
import 'package:watchhub/common/widgets/appbar/appbar.dart';
import 'package:watchhub/common/widgets/custom_shapes/curved_edges/curved_edge_widget.dart';
import 'package:watchhub/common/widgets/icons/wh_circular_icon.dart';
import 'package:watchhub/common/widgets/images/wh_rounded_image.dart';
import 'package:watchhub/features/shop/controllers/product/images_controller.dart';
import 'package:watchhub/utils/constants/colors.dart';
import 'package:watchhub/utils/constants/sizes.dart';
import 'package:watchhub/utils/helpers/helper_functions.dart';
import "package:watchhub/features/shop/models/product_model.dart";

class WHProductImageSlider extends StatelessWidget {
  const WHProductImageSlider({
    super.key,
    required this.product
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = WatchHubHelperFunctions.isDarkMode(context);
    final controller = Get.put(ImagesController());
    final images = controller.getAllProductImages(product);

    return WHCurvedEdgeWidget(
      child: Container(
        color: dark ? WatchHubColors.darkerGrey : WatchHubColors.light,
        child: Stack(
          children: [
            /// Main Large Image
            SizedBox(
              height: 400, 
              child: Padding(
                padding: const EdgeInsets.all(WatchHubSizes.productImageRadius * 2),
                child: Center(
                  child: Obx(
                    () { 
                      final image = controller.selectedProductImage.value;
                      return GestureDetector(
                        onTap: () => controller.showEnlargedImage(image),
                        child: CachedNetworkImage(
                          imageUrl: image, progressIndicatorBuilder: (_, __, downloadProgress) => 
                          CircularProgressIndicator(value: downloadProgress.progress, color: WatchHubColors.primary,),
                        ),
                      ); 
                    }
                  )
                ),
              )
            ),
    
            /// Image Slider
            Positioned(
              right: 0,
              bottom: 30,
              left: WatchHubSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  separatorBuilder: (_, __) => const SizedBox(width: WatchHubSizes.spaceBtwItems),
                  itemCount: images.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (_, index) => Obx(
                    (){ 
                      final imageSelected = controller.selectedProductImage.value == images[index];
                      return WHRoundedImage(
                        width: 80,
                        isNetworkImage: true,
                        imageUrl: images[index],
                        padding: const EdgeInsets.all(WatchHubSizes.sm),
                        backgroundColor: dark ? WatchHubColors.dark : WatchHubColors.white,
                        border: Border.all(color: imageSelected ? WatchHubColors.primary : Colors.transparent),
                        onPressed: () => controller.selectedProductImage.value = images[index],
                      );
                    }
                  ),
                ),
              ),
            ),
    
            /// Appbar icons
            WHAppBar(
              showBackArrow: true,
              actions: [
                WHCircularIcon(icon: Iconsax.heart5, onPressed: () {}, color: Colors.red,),
              ],
            )
          ]
        ),
      )
    );
  }
}
