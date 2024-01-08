import 'package:flutter/material.dart';
import 'package:watchhub/utils/constants/image_strings.dart';
import 'package:watchhub/utils/constants/sizes.dart';
import 'package:watchhub/utils/constants/text_strings.dart';
import 'package:watchhub/utils/helpers/helper_functions.dart';

class WHLoginHeader extends StatelessWidget {
  const WHLoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = WatchHubHelperFunctions.isDarkMode(context);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          height: 110,
          image: AssetImage(dark ? WatchHubImages.lightAppLogo : WatchHubImages.darkAppLogo),
        ),
        Text(WatchHubTextStrings.loginTitle, style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: WatchHubSizes.sm),
        Text(WatchHubTextStrings.loginSubTitle, style: Theme.of(context).textTheme.bodyMedium),
      ]
    );
  }
}