import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:watchhub/features/authentication/controllers/signup/signup_controller.dart';
import 'package:watchhub/utils/constants/colors.dart';
import 'package:watchhub/utils/constants/sizes.dart';
import 'package:watchhub/utils/constants/text_strings.dart';
import 'package:watchhub/utils/helpers/helper_functions.dart';
import 'package:watchhub/utils/validators/validation.dart';

class WHSignUpForm extends StatelessWidget {
  const WHSignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = WatchHubHelperFunctions.isDarkMode(context);
    final controller = Get.put(SignupController());

    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          /// First Name & Last Name
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) => WatchHubValidator.validateEmptyText('First name', value),
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
                  controller: controller.lastName,
                  validator: (value) => WatchHubValidator.validateEmptyText('Last name', value),
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
            controller: controller.username,
            validator: (value) => WatchHubValidator.validateEmptyText('Username', value),
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
            controller: controller.email,
            validator: (value) => WatchHubValidator.validateEmail(value),
            cursorOpacityAnimates: true,
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.direct),
              labelText: WatchHubTextStrings.email
            )
          ),
          const SizedBox(height: WatchHubSizes.spaceBtwInputFields),
    
          /// Phone Number
          TextFormField(
            controller: controller.phoneNumber,
            validator: (value) => WatchHubValidator.validatePhoneNumber(value),
            cursorOpacityAnimates: true,
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.call),
              labelText: WatchHubTextStrings.phoneNo
            )
          ),
          const SizedBox(height: WatchHubSizes.spaceBtwInputFields),
    
          /// Password
          Obx(
            () => TextFormField(
              controller: controller.password,
              validator: (value) => WatchHubValidator.validatePassword(value),
              obscureText: controller.hidePassword.value,
              cursorOpacityAnimates: true,
              decoration: InputDecoration(
                prefixIcon: const Icon(Iconsax.password_check),
                suffixIcon: IconButton(
                  icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye), 
                  onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                ),
                labelText: WatchHubTextStrings.password
              ),
            ),
          ),
          const SizedBox(height: WatchHubSizes.spaceBtwSections),
    
          /// Terms & Conditions checkbox
          Row(
            children: [
              SizedBox(
                width: 24, height: 24,
                child: Obx(
                  () => Checkbox(
                    value: controller.privacyPolicy.value, 
                    onChanged: (value) => controller.privacyPolicy.value = !controller.privacyPolicy.value,
                  )
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
              onPressed: () => controller.signup(),
              child: const Text(WatchHubTextStrings.createAccount),
            ),
          )
        ]
      )
    );
  }
}