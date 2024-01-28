import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:watchhub/data/repositories/authentication/authentication_repository.dart';
import 'package:watchhub/data/repositories/user/user_repository.dart';
import 'package:watchhub/features/authentication/screen/login/login.dart';
import 'package:watchhub/features/personalization/models/user_model.dart';
import 'package:watchhub/features/personalization/screen/profile/widgets/re_authenticate_user_login_form.dart';
import 'package:watchhub/utils/constants/image_strings.dart';
import 'package:watchhub/utils/helpers/network_manager.dart';
import 'package:watchhub/utils/popups/full_screen_loader.dart';
import 'package:watchhub/utils/popups/loaders.dart';
import "package:watchhub/utils/constants/sizes.dart";


class UserController extends GetxController {
  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;

  final hidePassword = true.obs;
  final imageUploading = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  /// Fetch user record
  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  /// Save user record from any registration provider
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      // First Update RX User and then check if user data is already stored . If not store new data
      await fetchUserRecord();

      // if no record already stored
      if (user.value.id.isEmpty) {
        if (userCredentials != null) {
          // Convert Name to first and last name
          final nameParts = UserModel.nameParts(userCredentials.user!.displayName ?? '');
          final username = UserModel.generateUsername(userCredentials.user!.displayName ?? '');

          // Map data
          final user = UserModel(
            id: userCredentials.user!.uid,
            firstName: nameParts[0],
            lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
            username: username,
            email: userCredentials.user!.email ?? '',
            phoneNumber: userCredentials.user!.phoneNumber ?? '',
            profilePicture: userCredentials.user!.photoURL ?? ''
          );

          // Save User Data
          await userRepository.saveUserRecord(user);
        }
      }
    } catch (e) {
      WHLoaders.warningSnackBar(
        title: "Data not saved",
        message: "Something went wrong while saving your information. You can re-save your data in your Profile."
      );
    }
  }


  /// Delete account warning
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(WatchHubSizes.md),
      title: "Delete Account",
      middleText: 'Are you sure you want to delete your account permanently? This action is not reversible and all of your data will be removed permanently.',
      confirm: ElevatedButton(
        onPressed: () async => deleteUserAccount(), 
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          side: const BorderSide(color: Colors.red)
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: WatchHubSizes.lg),
          child: Text('Delete'),
        )
      ),
      cancel: OutlinedButton(
        onPressed: () => Navigator.of(Get.overlayContext!).pop(), 
        child: const Text('Cancel')
      )
    );
  }

  /// Delete user account
  void deleteUserAccount() async {
    try {
      // Start Loading
      WHFullScreenLoader.openLoadingDialog("Deleting your account....", WatchHubImages.docerAnimation);

      /// First re-authenticate user
      final auth = AuthenticationRepository.instance;
      final provider = auth.authUser!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
        // Re Verify Auth Email
        if (provider == 'google.com') {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          WHFullScreenLoader.stopLoading();
          Get.offAll(() => const LoginScreen());
        } else if (provider == 'password') {
          WHFullScreenLoader.stopLoading();
          Get.to(() => const ReAuthLoginForm());
        }
      }
    } catch (e) {
      WHFullScreenLoader.stopLoading();
      WHLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  /// re-authenticate user before deleting account
  Future<void> reAuthenticateEmailAndPasswordUser() async {
    try {
      // Start Loading
      WHFullScreenLoader.openLoadingDialog("Processing....", WatchHubImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        WHFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!reAuthFormKey.currentState!.validate()) {
        WHFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.reAuthenticateWithEmailAndPassword(verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();
      WHFullScreenLoader.stopLoading();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      WHFullScreenLoader.stopLoading();
      WHLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }


  /// Upload Profile Picture
  uploadUserProfilePicture() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 70, maxHeight: 512, maxWidth: 512);
      if (image != null) {
        imageUploading.value = true;
        // Upload image
        final imageUrl = await userRepository.uploadImage("Users/Images/Profile/", image);

        // Update user image record
        Map<String, dynamic> json = {'ProfilePicture': imageUrl};
        await userRepository.updateSingleField(json);

        user.value.profilePicture = imageUrl;
        user.refresh();
        WHLoaders.successSnackBar(title: 'Congratulations', message: 'Your Profile Picture has been updated successfully');
      }
    } catch (e) {
      WHLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      imageUploading.value = false;
    }
  }

}