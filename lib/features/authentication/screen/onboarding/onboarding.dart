import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watchhub/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:watchhub/features/authentication/screen/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:watchhub/features/authentication/screen/onboarding/widgets/onboarding_next_button.dart';
import 'package:watchhub/features/authentication/screen/onboarding/widgets/onboarding_page.dart';
import 'package:watchhub/features/authentication/screen/onboarding/widgets/onboarding_skip.dart';
import 'package:watchhub/utils/constants/image_strings.dart';
import 'package:watchhub/utils/constants/text_strings.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    return Scaffold(
      body: Stack(
        children: [
          /// Horizontal Scrollable Pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: WatchHubImages.onBoardingImage1, 
                title: WatchHubTextStrings.onBoardingTitle1, 
                subtitle: WatchHubTextStrings.onBoardingSubTitle1
              ),
              OnBoardingPage(
                image: WatchHubImages.onBoardingImage2, 
                title: WatchHubTextStrings.onBoardingTitle2, 
                subtitle: WatchHubTextStrings.onBoardingSubTitle2
              ),
              OnBoardingPage(
                image: WatchHubImages.onBoardingImage3, 
                title: WatchHubTextStrings.onBoardingTitle3, 
                subtitle: WatchHubTextStrings.onBoardingSubTitle3
              ),
            ],
          ),

          /// Skip Button
          const OnBoardingSkip(),

          /// Dot Navigation SmoothPageIndicator
          const OnBoardingDotNavigation(),

          /// Circular Button
          const OnBoardingNextButton()
        ],
      ),
    );
  }
}
