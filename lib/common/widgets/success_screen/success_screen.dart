import "package:flutter/material.dart";
import "package:watchhub/common/style/spacing_styles.dart";
import "package:watchhub/utils/constants/sizes.dart";
import "package:watchhub/utils/constants/text_strings.dart";
import "package:watchhub/utils/helpers/helper_functions.dart";

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key, required this.title, required this.subtitle, required this.image, this.onPressed});

  final String title;
  final String subtitle; 
  final String image;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
         padding: WatchHubSpacingStyles.paddingWithAppBarHeight * 2,
         child: Column(
          children: [
            /// Image
            Image(
                image: AssetImage(image),
                width: WatchHubHelperFunctions.screenWidth() * 0.6,
            ),
            const SizedBox(height: WatchHubSizes.spaceBtwSections),
            
            /// Title and subtitle
            Text(title, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
            const SizedBox(height: WatchHubSizes.spaceBtwItems),
            Text(subtitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),
            const SizedBox(height: WatchHubSizes.spaceBtwSections),
            
            /// Buttons
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onPressed,
                child: const Text(WatchHubTextStrings.whContinue),
              )
            ),
          ],
         ),
        )
      ),
    );
  }
}