import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watchhub/data/repositories/authentication/authentication_repository.dart';
import 'package:watchhub/features/authentication/controllers/signup/verify_email_controller.dart';
import 'package:watchhub/utils/constants/image_strings.dart';
import 'package:watchhub/utils/constants/sizes.dart';
import 'package:watchhub/utils/constants/text_strings.dart';
import 'package:watchhub/utils/helpers/helper_functions.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => AuthenticationRepository.instance.logout(), 
            icon: const Icon(CupertinoIcons.clear)
          )
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
              Text(WatchHubTextStrings.confirmEmail, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
              const SizedBox(height: WatchHubSizes.spaceBtwItems),
              Text(email ?? '', style: Theme.of(context).textTheme.labelLarge, textAlign: TextAlign.center),
              const SizedBox(height: WatchHubSizes.spaceBtwItems),
              Text(WatchHubTextStrings.confirmEmailSubTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),
              const SizedBox(height: WatchHubSizes.spaceBtwSections),

              /// Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => controller.checkEmailVerificationStatus(),
                  child: const Text(WatchHubTextStrings.whContinue),
                )
              ),

              const SizedBox(height: WatchHubSizes.spaceBtwItems),

              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () => controller.sendEmailVerification(),
                  child: const Text(WatchHubTextStrings.resendEmail),
                )
              ),
            ],
          )
        ),
      ),
    );
  }
}