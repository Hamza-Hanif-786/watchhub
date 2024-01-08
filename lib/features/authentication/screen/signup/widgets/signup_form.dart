import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:watchhub/features/authentication/screen/signup/verify_email.dart';
import 'package:watchhub/utils/constants/colors.dart';
import 'package:watchhub/utils/constants/sizes.dart';
import 'package:watchhub/utils/constants/text_strings.dart';
import 'package:watchhub/utils/helpers/helper_functions.dart';

class WHSignUpForm extends StatelessWidget {
  const WHSignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = WatchHubHelperFunctions.isDarkMode(context);
    
    return Form(
      child: Column(
        children: [
          /// First Name & Last Name
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  expands: false,
                  cursorOpacityAnimates: true,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.user),
                    labelText: WatchHubTextStrings.firstName
                  )
                ),
              ),
    
              const SizedBox(width: WatchHubSizes.spaceBtwInputFields),
    
              Expanded(
                child: TextFormField(
                  expands: false,
                  cursorOpacityAnimates: true,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.user),
                    labelText: WatchHubTextStrings.lastName
                  )
                ),
              )
            ]
          ),
          const SizedBox(height: WatchHubSizes.spaceBtwInputFields),
    
          /// Username
          TextFormField(
            expands: false,
            cursorOpacityAnimates: true,
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.user_edit),
              labelText: WatchHubTextStrings.username
            )
          ),
          const SizedBox(height: WatchHubSizes.spaceBtwInputFields),
    
          /// Email
          TextFormField(
            cursorOpacityAnimates: true,
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.direct),
              labelText: WatchHubTextStrings.email
            )
          ),
          const SizedBox(height: WatchHubSizes.spaceBtwInputFields),
    
          /// Phone Number
          TextFormField(
            cursorOpacityAnimates: true,
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.call),
              labelText: WatchHubTextStrings.phoneNo
            )
          ),
          const SizedBox(height: WatchHubSizes.spaceBtwInputFields),
    
          /// Password
          TextFormField(
            obscureText: true,
            cursorOpacityAnimates: true,
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: Icon(Iconsax.eye_slash),
              labelText: WatchHubTextStrings.password
            ),
          ),
          const SizedBox(height: WatchHubSizes.spaceBtwSections),
    
          /// Terms & Conditions checkbox
          Row(
            children: [
              SizedBox(
                width: 24,
                height: 24,
                child: Checkbox(
                  value: true,
                  onChanged: (value) {},
                ),
              ),
              const SizedBox(width: WatchHubSizes.spaceBtwItems),
              Text.rich(TextSpan(
                children: [
                  TextSpan(text: '${WatchHubTextStrings.iAgreeTo} ', style: Theme.of(context).textTheme.bodySmall),
                  TextSpan(text: '${WatchHubTextStrings.privacyPolicy} ', style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: dark ? WatchHubColors.white : WatchHubColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor: dark ? WatchHubColors.white : WatchHubColors.primary
                  )),
                  TextSpan(text: '${WatchHubTextStrings.and} ', style: Theme.of(context).textTheme.bodySmall),
                  TextSpan(text: '${WatchHubTextStrings.termsOfuse} ', style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: dark ? WatchHubColors.white : WatchHubColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor: dark ? WatchHubColors.white : WatchHubColors.primary
                  )),
                ]
              ))
            ]
          ),
          const SizedBox(height: WatchHubSizes.spaceBtwSections),
    
          /// Signup button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => Get.to(() => const VerifyEmailScreen(),transition: Transition.fadeIn),
              child: const Text(WatchHubTextStrings.createAccount),
            ),
          )
        ]
      )
    );
  }
}