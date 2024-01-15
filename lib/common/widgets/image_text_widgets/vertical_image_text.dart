import 'package:flutter/material.dart';
import 'package:watchhub/utils/constants/colors.dart';
import 'package:watchhub/utils/constants/sizes.dart';
import 'package:watchhub/utils/helpers/helper_functions.dart';

class WHVerticalImageText extends StatelessWidget {
  const WHVerticalImageText({
    super.key, 
    required this.image, 
    required this.title, 
    this.textColor = WatchHubColors.white, 
    this.backgroundColor = WatchHubColors.white, 
    this.onTap,
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = WatchHubHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: WatchHubSizes.spaceBtwItems),
        child: Column(
          children: [
            /// Circular Icon
            Container(
              height: 56,
              width: 56,
              padding: const EdgeInsets.all(WatchHubSizes.sm),
              decoration: BoxDecoration(
                color: backgroundColor ?? (dark ? WatchHubColors.black : WatchHubColors.white),
                borderRadius: BorderRadius.circular(100)
              ),
              child: Center(
                child: Image(image: AssetImage(image), fit: BoxFit.cover),
              ),
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
