import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:watchhub/common/widgets/appbar/appbar.dart';
import 'package:watchhub/common/widgets/custom_shapes/curved_edges/curved_edge_widget.dart';
import 'package:watchhub/common/widgets/icons/wh_circular_icon.dart';
import 'package:watchhub/common/widgets/images/wh_rounded_image.dart';
import 'package:watchhub/utils/constants/colors.dart';
import 'package:watchhub/utils/constants/image_strings.dart';
import 'package:watchhub/utils/constants/sizes.dart';
import 'package:watchhub/utils/helpers/helper_functions.dart';

class WHProductImageSlider extends StatelessWidget {
  const WHProductImageSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = WatchHubHelperFunctions.isDarkMode(context);
    
    return WHCurvedEdgeWidget(
      child: Container(
        color: dark ? WatchHubColors.darkerGrey : WatchHubColors.light,
        child: Stack(
          children: [
            /// Main Large Image
            const SizedBox(
              height: 400, 
              child: Padding(
                padding: EdgeInsets.all(WatchHubSizes.productImageRadius * 2),
                child: Center(
                  child: Image(
                    image: AssetImage(WatchHubImages.smartIcon)
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
                  itemCount: 6,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (_, index) => WHRoundedImage(
                    width: 80,
                    backgroundColor: dark ? WatchHubColors.dark : WatchHubColors.white,
                    border: Border.all(color: WatchHubColors.primary),
                    padding: const EdgeInsets.all(WatchHubSizes.sm),
                    imageUrl: WatchHubImages.smartIcon
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
