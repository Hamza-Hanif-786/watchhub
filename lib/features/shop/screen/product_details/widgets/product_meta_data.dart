import 'package:flutter/material.dart';
import 'package:watchhub/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:watchhub/common/widgets/images/wh_circular_image.dart';
import 'package:watchhub/common/widgets/texts/product_price_text.dart';
import 'package:watchhub/common/widgets/texts/product_title_text.dart';
import 'package:watchhub/common/widgets/texts/wh_brand_title_text_with_verified_icon.dart';
import 'package:watchhub/utils/constants/colors.dart';
import 'package:watchhub/utils/constants/enums.dart';
import 'package:watchhub/utils/constants/image_strings.dart';
import 'package:watchhub/utils/constants/sizes.dart';
import 'package:watchhub/utils/helpers/helper_functions.dart';

class WHProductMetaData extends StatelessWidget {
  const WHProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = WatchHubHelperFunctions.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// -- Price & Sale Price
        Row(
          children: [
            /// Sale Tag
            WHRoundedContainer(
              radius: WatchHubSizes.sm,
              backgroundColor: WatchHubColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(horizontal: WatchHubSizes.sm, vertical: WatchHubSizes.xs),
              child: Text("65%", style: Theme.of(context).textTheme.labelLarge!.apply(color: WatchHubColors.black)),
            ),
            const SizedBox(width: WatchHubSizes.spaceBtwItems),       
            
            /// Price
            Text("\$100.0", style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough)),
            const SizedBox(width: WatchHubSizes.spaceBtwItems),       
            const WHProductPriceText(price: "35.0", isLarge: true,),
          ]
        ),
        const SizedBox(height: WatchHubSizes.spaceBtwItems / 1.5),       
        
        /// -- Title
        const WHProductTitleText(title: "Apple Smart Watch"),
        const SizedBox(height: WatchHubSizes.spaceBtwItems / 1.5),       
         
        /// -- Stock Status
        Row(
          children: [
            const WHProductTitleText(title: "Status:"),
            const SizedBox(width: WatchHubSizes.spaceBtwItems),       
            Text("In Stock", style: Theme.of(context).textTheme.titleMedium),     
          ],
        ),
        const SizedBox(height: WatchHubSizes.spaceBtwItems / 1.5), 
         
        /// -- Brand
        Row(
          children: [
            WHCircularImage(
              image: WatchHubImages.appleLogo,
              width: 32,
              height: 32,
              overlayColor: dark ? WatchHubColors.white : WatchHubColors.black,
            ),
            const WHBrandTitleWithVerifiedIcon(title: "Apple", brandTextSize: TextSizes.medium),
          ],
        ),
      ],
    );
  }
}