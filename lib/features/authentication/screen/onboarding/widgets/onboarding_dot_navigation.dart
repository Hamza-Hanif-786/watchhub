import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:watchhub/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:watchhub/utils/constants/colors.dart';
import 'package:watchhub/utils/constants/sizes.dart';
import 'package:watchhub/utils/device/device_utility.dart';
import 'package:watchhub/utils/helpers/helper_functions.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    final dark = WatchHubHelperFunctions.isDarkMode(context);

    return Positioned(
      bottom: WatchHubDeviceUtils.getBottomNavigationBarHeight() + 25,
      left: WatchHubSizes.defaultSpace,
      child: SmoothPageIndicator(
        count: 3,
        controller: controller.pageController,
        onDotClicked: controller.dotNavigationClick, 
        effect: ExpandingDotsEffect(activeDotColor: dark ? WatchHubColors.light : WatchHubColors.dark, dotHeight: 6),
      ),
    );
  }
}