import 'package:flutter/material.dart';
import 'package:watchhub/utils/constants/colors.dart';
import 'package:watchhub/utils/constants/image_strings.dart';
import 'package:watchhub/utils/constants/sizes.dart';

class WHSocialButtons extends StatelessWidget {
  const WHSocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: WatchHubColors.grey),
            borderRadius: BorderRadius.circular(100)
          ),
          child: IconButton(
            onPressed: () {}, 
            icon: const Image(
              width: WatchHubSizes.iconMd,
              height: WatchHubSizes.iconMd,
              image: AssetImage(WatchHubImages.google),
            )
          ),
        ),
    
        const SizedBox(width: WatchHubSizes.spaceBtwItems),
    
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: WatchHubColors.grey),
            borderRadius: BorderRadius.circular(100)
          ),
          child: IconButton(
            onPressed: () {}, 
            icon: const Image(
              width: WatchHubSizes.iconMd,
              height: WatchHubSizes.iconMd,
              image: AssetImage(WatchHubImages.facebook),
            )
          ),
        ),
      ]
    );
  }
}

