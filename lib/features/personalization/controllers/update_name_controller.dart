import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watchhub/data/repositories/user/user_repository.dart';
import 'package:watchhub/features/personalization/controllers/user_controller.dart';
import 'package:watchhub/features/personalization/screen/profile/profile.dart';
import 'package:watchhub/utils/constants/image_strings.dart';
import 'package:watchhub/utils/helpers/network_manager.dart';
import 'package:watchhub/utils/popups/full_screen_loader.dart';
import 'package:watchhub/utils/popups/loaders.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  // init user data when Home Screen appears
  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  /// Fetch user record
  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try {
      // Start Loading
      WHFullScreenLoader.openLoadingDialog("We are updating your information....", WatchHubImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        WHFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!updateUserNameFormKey.currentState!.validate()) {
        WHFullScreenLoader.stopLoading();
        return;
      }

      // Update User's first and last name in the Firebase firestore
      Map<String, dynamic> name = {'FirstName': firstName.text.trim(), 'LastName': lastName.text.trim()};
      await userRepository.updateSingleField(name);

      // Update the RX user value
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      // Remove Loader
      WHFullScreenLoader.stopLoading();

      // Show Success Message
      WHLoaders.successSnackBar(title: 'Congratulations', message: 'Your name has been updated');

      // Move to Previous Screen
      Get.off(() => const ProfileScreen());
    } catch (e) {
      // Remove Loader
      WHFullScreenLoader.stopLoading();

      // Show some Generic error to the user
      WHLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}