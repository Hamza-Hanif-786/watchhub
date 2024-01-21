
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:watchhub/utils/constants/colors.dart';
import 'package:watchhub/utils/helpers/helper_functions.dart';

class WHLoaders{
  static hideSnackBar() => ScaffoldMessenger.of(Get.context!).hideCurrentSnackBar();

  static customToast({required message}) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        elevation: 0,
        duration: const Duration(seconds: 5),
        backgroundColor: Colors.transparent,
        content: Container(
          padding: const EdgeInsets.all(12.0),
          margin: const EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: WatchHubHelperFunctions.isDarkMode(Get.context!) ? WatchHubColors.darkerGrey.withOpacity(0.9) : WatchHubColors.grey.withOpacity(0.9),
          ),
          child: Center(
            child: Text(message, style: Theme.of(Get.context!).textTheme.labelLarge),
          ),
        ),
      )
    );
  }

  static errorSnackBar({required title, message = ''}) {
    Get.snackbar(
      title, 
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: WatchHubColors.white,
      backgroundColor: Colors.red.shade600,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 5),
      margin: const EdgeInsets.all(20),
      icon: const Icon(Iconsax.warning_2, color: WatchHubColors.white),
    );
  }

  static successSnackBar({required title, message = '', duration = 5}) {
    Get.snackbar(
      title, 
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: WatchHubColors.white,
      backgroundColor: WatchHubColors.primary,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: duration),
      margin: const EdgeInsets.all(10),
      icon: const Icon(Iconsax.check, color: WatchHubColors.white),
    );
  }

  static warningSnackBar({required title, message = ''}) {
    Get.snackbar(
      title, 
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: WatchHubColors.white,
      backgroundColor: Colors.orange,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 5),
      margin: const EdgeInsets.all(20),
      icon: const Icon(Iconsax.warning_2, color: WatchHubColors.white),
    );
  }
}