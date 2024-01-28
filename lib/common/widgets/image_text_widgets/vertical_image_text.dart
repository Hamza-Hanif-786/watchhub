import 'package:flutter/material.dart';
import 'package:watchhub/common/widgets/images/wh_circular_image.dart';
import 'package:watchhub/utils/constants/colors.dart';
import 'package:watchhub/utils/constants/sizes.dart';

class WHVerticalImageText extends StatelessWidget {
  const WHVerticalImageText({
    super.key, 
    required this.image, 
    required this.title, 
    this.textColor = WatchHubColors.white, 
    this.backgroundColor = WatchHubColors.white, 
    this.onTap,
    this.isNetworkImage = true
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;
  final bool isNetworkImage;

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: WatchHubSizes.spaceBtwItems),
        child: Column(
          children: [
            /// Circular Icon
            WHCircularImage(
              image: image,
              fit: BoxFit.fitWidth,
              padding: WatchHubSizes.sm * 1.4,
              isNetworkImage: isNetworkImage,
              backgroundColor: backgroundColor,
            ),
        
            const SizedBox(height: WatchHubSizes.spaceBtwItems / 2),
        
            /// Text
            SizedBox(
              width: 55,
              child: Text(
                title, 
                style: Theme.of(context).textTheme.labelMedium!.apply(color: WatchHubColors.white),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )
            ),
          ],
        ),
      ),
    );
  }
}
