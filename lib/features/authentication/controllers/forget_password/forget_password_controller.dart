import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watchhub/data/repositories/authentication/authentication_repository.dart';
import 'package:watchhub/features/authentication/screen/password_configuration/reset_password.dart';
import 'package:watchhub/utils/constants/image_strings.dart';
import 'package:watchhub/utils/helpers/network_manager.dart';
import 'package:watchhub/utils/popups/full_screen_loader.dart';
import 'package:watchhub/utils/popups/loaders.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  /// Variables
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  /// Send Reset Password email
  sendPasswordResetEmail() async {
    try {
      // Start Loading
      WHFullScreenLoader.openLoadingDialog("Processing your request....", WatchHubImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        WHFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        WHFullScreenLoader.stopLoading();
        return;
      }

      // Send Password Reset Email
      await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());

      // Remove Loader
      WHFullScreenLoader.stopLoading();

      // Show Success Screen
      WHLoaders.successSnackBar(title: 'Email Sent', message: 'Email Link Sent to Rest your Password'.tr);

      // Redirect
      Get.to(() => ResetPassword(email: email.text.trim()));
      
    } catch (e) {
      // Remove Loader
      WHFullScreenLoader.stopLoading();
      WHLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      // Start Loading
      WHFullScreenLoader.openLoadingDialog("Processing your request....", WatchHubImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        WHFullScreenLoader.stopLoading();
        return;
      }

      // Send Password Reset Email
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      // Remove Loader
      WHFullScreenLoader.stopLoading();

      // Show Success Screen
      WHLoaders.successSnackBar(title: 'Email Sent', message: 'Email Link Sent to Rest your Password'.tr);
      
    } catch (e) {
      // Remove Loader
      WHFullScreenLoader.stopLoading();
      WHLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

}