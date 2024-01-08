import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:iconsax/iconsax.dart";
import "package:watchhub/features/authentication/screen/password_configuration/reset_password.dart";
import "package:watchhub/utils/constants/colors.dart";
import "package:watchhub/utils/constants/sizes.dart";
import "package:watchhub/utils/constants/text_strings.dart";
import "package:watchhub/utils/helpers/helper_functions.dart";

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

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
      body: Padding(
        padding: const EdgeInsets.all(WatchHubSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Headings
            Text(WatchHubTextStrings.forgetPasswordTitle, style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: WatchHubSizes.spaceBtwItems),
            Text(WatchHubTextStrings.forgetPasswordSubTitle, style: Theme.of(context).textTheme.labelMedium),
            const SizedBox(height: WatchHubSizes.spaceBtwSections * 2),


            /// Text Field
            TextFormField(
              decoration: const InputDecoration(
                labelText: WatchHubTextStrings.email,
                prefixIcon: Icon(Iconsax.direct_right),
              ),
            ),
            const SizedBox(height: WatchHubSizes.spaceBtwSections),

            /// Submit Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: () => Get.off(() => const ResetPassword()), child: const Text(WatchHubTextStrings.submit)),
            )
          ],
        ),
      ),
    );
  }
}