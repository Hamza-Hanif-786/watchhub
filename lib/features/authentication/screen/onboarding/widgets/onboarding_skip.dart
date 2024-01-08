import 'package:flutter/material.dart';
import 'package:watchhub/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:watchhub/utils/constants/sizes.dart';
import 'package:watchhub/utils/device/device_utility.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: WatchHubDeviceUtils.getAppBarHeight(),
      right: WatchHubSizes.defaultSpace,
      child: TextButton(
        onPressed: () => OnBoardingController.instance.skipPage(),
        child: const Text("Skip"),
      )
    );
  }
}