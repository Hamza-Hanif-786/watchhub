import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:watchhub/data/repositories/authentication/authentication_repository.dart';
import 'package:watchhub/features/personalization/controllers/user_controller.dart';
import 'package:watchhub/utils/constants/image_strings.dart';
import 'package:watchhub/utils/helpers/network_manager.dart';
import 'package:watchhub/utils/popups/full_screen_loader.dart';
import 'package:watchhub/utils/popups/loaders.dart';

class LoginController extends GetxController {

  /// Variables
  final hidePassword = true.obs;
  final rememberMe = false.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());

  @override
  void onInit() {
    email.text = localStorage.read("REMEMBER_ME_EMAIL") ?? "";
    password.text = localStorage.read("REMEMBER_ME_PASSWORD") ?? "";
    super.onInit();
  }

  /// --- Email & Password SignIn
  Future<void> emailAndPasswordSignIn() async {
    try {
      // Start Loading
      WHFullScreenLoader.openLoadingDialog("Logging You In....", WatchHubImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        WHFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!loginFormKey.currentState!.validate()) {
        WHFullScreenLoader.stopLoading();
        return;
      }

      // Save data if remember me is checked
      if (rememberMe.value) {
        localStorage.write("REMEMBER_ME_EMAIL", email.text.trim());
        localStorage.write("REMEMBER_ME_PASSWORD", password.text.trim());
      }

      // Login user using Email & Password Authentication
      await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      // Remove Loader
      WHFullScreenLoader.stopLoading();

      // Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      WHFullScreenLoader.stopLoading();
      WHLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  /// --- Google SignIn
  Future<void> googleSignIn() async {
    try {
      // Start Loading
      WHFullScreenLoader.openLoadingDialog("Logging You In....", WatchHubImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        WHFullScreenLoader.stopLoading();
        return;
      }

      // Login user using Google Authentication
      final userCredentials = await AuthenticationRepository.instance.signInWithGoogle();

      // Save User Record
      await userController.saveUserRecord(userCredentials);

      // Remove Loader
      WHFullScreenLoader.stopLoading();

      // Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      // Remove Loader
      WHFullScreenLoader.stopLoading();
      WHLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

}