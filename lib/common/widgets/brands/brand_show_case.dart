import 'package:flutter/material.dart';
import 'package:watchhub/common/widgets/brands/brand_card.dart';
import 'package:watchhub/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:watchhub/utils/constants/colors.dart';
import 'package:watchhub/utils/constants/sizes.dart';
import 'package:watchhub/utils/helpers/helper_functions.dart';

class WHBrandShowcase extends StatelessWidget {
  const WHBrandShowcase({
    super.key,
    required this.images
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {

    return WHRoundedContainer(
      showBorder: true,
      borderColor: WatchHubColors.darkGrey,
      backgroundColor: Colors.transparent,
      padding: const EdgeInsets.all(WatchHubSizes.md),
      margin: const EdgeInsets.only(bottom: WatchHubSizes.spaceBtwItems),
      child: Column(
        children: [
          /// Brand with Product Count
          const WHBrandCard(showBorder: false),
          const SizedBox(height: WatchHubSizes.spaceBtwItems),
    
          /// Brand Top 3 Product Images
          Row(
            children: images.map((image) => brandTopProductImageWidget(image, context)).toList()
    
          ) 
        ],
      ),
    );
  }
}

Widget brandTopProductImageWidget(String image, context) {
  final dark = WatchHubHelperFunctions.isDarkMode(context);

  return Expanded(
    child: WHRoundedContainer(
      height: 100,
      padding: const EdgeInsets.all(WatchHubSizes.md),
      margin: const EdgeInsets.only(right: WatchHubSizes.sm),
      backgroundColor: dark ? WatchHubColors.darkerGrey : WatchHubColors.light,
      child: Image(fit: BoxFit.contain, image: AssetImage(image)),
    ),
  );
}