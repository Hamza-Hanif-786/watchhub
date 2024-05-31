import 'package:flutter/material.dart';
import 'package:watchhub/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:watchhub/common/widgets/images/wh_circular_image.dart';
import 'package:watchhub/common/widgets/texts/wh_brand_title_text_with_verified_icon.dart';
import 'package:watchhub/features/shop/models/brand_model.dart';
import 'package:watchhub/utils/constants/colors.dart';
import 'package:watchhub/utils/constants/enums.dart';
import 'package:watchhub/utils/constants/sizes.dart';
import 'package:watchhub/utils/helpers/helper_functions.dart';

class WHBrandCard extends StatelessWidget {
  const WHBrandCard({
    super.key,
    this.onTap,
    required this.showBorder, 
    required this.brand
  });

  final BrandModel brand;
  final void Function()? onTap;
  final bool showBorder;

  @override
  Widget build(BuildContext context) {
    final dark = WatchHubHelperFunctions.isDarkMode(context);
    
    return GestureDetector(
      onTap: onTap,
      child: WHRoundedContainer(
        padding: const EdgeInsets.all(WatchHubSizes.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            /// -- Icon
            Flexible(
              child: WHCircularImage(
                isNetworkImage: true,
                image: brand.image,
                backgroundColor: Colors.transparent,
                overlayColor: dark ? WatchHubColors.white : WatchHubColors.black,
              ),
            ),
            const SizedBox(width: WatchHubSizes.spaceBtwItems / 2),
                            
            /// -- Text
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WHBrandTitleWithVerifiedIcon(title: brand.name, brandTextSize: TextSizes.large),
                  Text(
                    '${brand.productsCount ?? 0} products',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
