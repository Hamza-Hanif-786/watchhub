import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watchhub/data/repositories/authentication/authentication_repository.dart';
import 'package:watchhub/data/repositories/user/user_repository.dart';
import 'package:watchhub/features/authentication/screen/signup/verify_email.dart';
import 'package:watchhub/features/personalization/models/user_model.dart';
import 'package:watchhub/utils/constants/image_strings.dart';
import 'package:watchhub/utils/helpers/network_manager.dart';
import 'package:watchhub/utils/popups/full_screen_loader.dart';
import 'package:watchhub/utils/popups/loaders.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// Variables
  final hidePassword = true.obs;                      // Hide Password
  final privacyPolicy = false.obs;                    // Privacy Policy
  final email = TextEditingController();               // Controller for Email
  final password = TextEditingController();            // Controller for Password
  final username = TextEditingController();            // Controller for Username
  final firstName = TextEditingController();           // Controller for First Name
  final lastName = TextEditingController();            // Controller for Last Name
  final phoneNumber = TextEditingController();          // Controller for Phone Number
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();          // Form key for Signup Form validation

  /// -- SIGNUP
  void signup() async {
    try {
      // Start Loading
      WHFullScreenLoader.openLoadingDialog('We are processing your information...', WatchHubImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        WHFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!signupFormKey.currentState!.validate()) {
        WHFullScreenLoader.stopLoading();
        return;
      }

      // Privacy Policy Check
      if (!privacyPolicy.value) {
        WHFullScreenLoader.stopLoading();
        WHLoaders.warningSnackBar(
          title: 'Accept Privacy Policy', 
          message: 'In order to create an account, you must have to read and accept the Privacy Policy & Terms of Use.'
        );
        return;
      }
      
    
      // Register user in the Firebase Authentication & Save user data in the Firebase
      final userCredential = await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim());

      // Save Authenticated User data in the Firebase Firestore
      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        username: username.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      // Remove Loader
      WHFullScreenLoader.stopLoading();

      // Show Success Message
      WHLoaders.successSnackBar(title: 'Congratulations', message: 'Your account has been created! Verfiy email to continue');

      // Move to Verify Email Screen
      Get.to(() => VerifyEmailScreen(email: email.text.trim()));
      
    } catch (e) {
      // Remove Loader
      WHFullScreenLoader.stopLoading();

      // Show some Generic error to the user
      WHLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  } 
}