import "dart:async";

import "package:firebase_auth/firebase_auth.dart";
import "package:get/get.dart";
import "package:watchhub/common/widgets/success_screen/success_screen.dart";
import "package:watchhub/data/repositories/authentication/authentication_repository.dart";
import "package:watchhub/utils/constants/image_strings.dart";
import "package:watchhub/utils/constants/text_strings.dart";
import "package:watchhub/utils/popups/loaders.dart";

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  /// Send Email whenever Verify screen appears & set timer for auto redirect
  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }


  /// Send Email Verfication Link
  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      WHLoaders.successSnackBar(title: 'Email Sent', message: 'Please Check your inbox and verify your email.');
    } catch (e) {
      WHLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
   
  /// Timer to automatically redirect on Email Verification
  setTimerForAutoRedirect() {
    Timer.periodic(
      const Duration(seconds: 1), 
      (timer) async {
        await FirebaseAuth.instance.currentUser?.reload();
        final user = FirebaseAuth.instance.currentUser;
        if(user?.emailVerified ?? false) {
          timer.cancel();
          Get.off(() => SuccessScreen(
            title: WatchHubTextStrings.yourAccountCreatedTitle, 
            subtitle: WatchHubTextStrings.yourAccountCreatedSubTitle, 
            image: WatchHubImages.successfullyRegisterAnimation,
            onPressed: () => AuthenticationRepository.instance.screenRedirect(),
            )
          );
        }
      }
    );
  }
   
  /// Manually Check if Email Verified
  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if(currentUser != null && currentUser.emailVerified){
      Get.off(() => SuccessScreen(
        title: WatchHubTextStrings.yourAccountCreatedTitle, 
        subtitle: WatchHubTextStrings.yourAccountCreatedSubTitle, 
        image: WatchHubImages.successfullyRegisterAnimation,
        onPressed: () => AuthenticationRepository.instance.screenRedirect(),
      ));
    }
  } 
  
}