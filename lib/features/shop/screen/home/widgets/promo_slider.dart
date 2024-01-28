import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watchhub/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:watchhub/common/widgets/images/wh_rounded_image.dart';
import 'package:watchhub/common/widgets/shimmers/shimmer.dart';
import 'package:watchhub/features/shop/controllers/banner_controller.dart';
import 'package:watchhub/utils/constants/colors.dart';
import 'package:watchhub/utils/constants/sizes.dart';

class WHPromoSlider extends StatelessWidget {
  const WHPromoSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());

    return Obx(
      () {
        // Loader
        if (controller.isLoading.value) return const WHShimmerEffect(width: double.infinity, height: 190);

        // No Data Found
        if(controller.banners.isEmpty) {
          return const Center(child: Text("No Data Found!"));
        } else {
          return Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  onPageChanged: (index, _) => controller.updatePageIndicator(index),
                  viewportFraction: 1,
                  initialPage: 0,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: true,
                  autoPlay: true
                ),
                items: controller.banners.map(
                  (banner) => WHRoundedImage(
                    imageUrl: banner.imageUrl, 
                    isNetworkImage: true
                  )
                ).toList(),
              ),

              const SizedBox(height: WatchHubSizes.spaceBtwItems),

              Center(
                child: Obx(
                  () => Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for (int i = 0; i < controller.banners.length; i++)
                      WHCircularContainer(
                        width: 20,
                        height: 5,
                        margin: const EdgeInsets.only(right: 10),
                        backgroundColor: controller.carousalCurrentIndex.value == i ? WatchHubColors.primary : WatchHubColors.grey,
                      ),
                    ]
                  ),
                ),
              )
            ],
          );
        }
      } 
    );
  }
}
