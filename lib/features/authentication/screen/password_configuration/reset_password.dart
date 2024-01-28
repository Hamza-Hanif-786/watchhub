import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watchhub/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:watchhub/features/authentication/screen/login/login.dart';
import 'package:watchhub/utils/constants/image_strings.dart';
import 'package:watchhub/utils/constants/sizes.dart';
import 'package:watchhub/utils/constants/text_strings.dart';
import 'package:watchhub/utils/helpers/helper_functions.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () => Get.back(), icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(WatchHubSizes.defaultSpace),
          child: Column(
            children: [
              /// Image
              Image(
                image: const AssetImage(WatchHubImages.deliveredEmailIllustration),
                width: WatchHubHelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(height: WatchHubSizes.spaceBtwSections),

              /// Title and Subtitle
              Text(email, style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center),
              const SizedBox(height: WatchHubSizes.spaceBtwItems),
              Text(WatchHubTextStrings.changeYourPasswordTitle, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
              const SizedBox(height: WatchHubSizes.spaceBtwItems),
              Text(WatchHubTextStrings.changeYourPasswordSubTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),
              const SizedBox(height: WatchHubSizes.spaceBtwSections),
              
              /// Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.offAll(() => const LoginScreen(), transition: Transition.fade),
                  child: const Text(WatchHubTextStrings.done),
                )
              ),
              const SizedBox(height: WatchHubSizes.spaceBtwItems),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () => ForgetPasswordController.instance.resendPasswordResetEmail(email),
                  child: const Text(WatchHubTextStrings.resendEmail),
                )
              )
            ]
          ),
        ),
      ),
    );
  }
}