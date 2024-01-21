import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watchhub/common/widgets/loaders/animation_loader.dart';
import 'package:watchhub/utils/constants/colors.dart';
import 'package:watchhub/utils/helpers/helper_functions.dart';

class WHFullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,                  // use Get.overlayContext for overlays dialog 
      barrierDismissible: false,                     // the dialod can't be dismissed by tapping outside
      builder: (_) => PopScope(
        canPop: false,                               // Disables the popping with back button
        child: Container(
          color: WatchHubHelperFunctions.isDarkMode(Get.context!) ? WatchHubColors.dark : WatchHubColors.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 250),
              WHAnimationLoaderWidget(text: text, animation: animation),
            ],
          ),
        )
      )
    );
  }


  /// Stop the Currently open loading dialog
  /// This method doesn't return anything
  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop();          // stop the loading dialog using Navigator
  }
}