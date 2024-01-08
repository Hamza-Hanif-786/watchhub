import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:iconsax/iconsax.dart";
import "package:watchhub/common/widgets/login_signup/form_divider.dart";
import "package:watchhub/common/widgets/login_signup/social_buttons.dart";
import "package:watchhub/features/authentication/screen/signup/widgets/signup_form.dart";
import "package:watchhub/utils/constants/colors.dart";
import "package:watchhub/utils/constants/sizes.dart";
import "package:watchhub/utils/constants/text_strings.dart";
import "package:watchhub/utils/helpers/helper_functions.dart";

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = WatchHubHelperFunctions.isDarkMode(context);
    
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Iconsax.arrow_left),
          color: dark ? WatchHubColors.light : WatchHubColors.dark,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(WatchHubSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// Title 
              Text(WatchHubTextStrings.signupTitle, style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: WatchHubSizes.spaceBtwSections),

              /// Form
              const WHSignUpForm(),
              const SizedBox(height: WatchHubSizes.spaceBtwSections),
              
              /// Divider
              WHFormDivider(dividerText: WatchHubTextStrings.orSignUpWith.capitalize!),
              const SizedBox(height: WatchHubSizes.spaceBtwSections),

              /// Social Buttons
              const WHSocialButtons()
            ]
          ),
        ),
      ),
    );
  }
}

