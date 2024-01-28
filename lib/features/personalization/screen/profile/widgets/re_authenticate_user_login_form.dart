import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:watchhub/features/personalization/controllers/user_controller.dart';
import 'package:watchhub/utils/constants/sizes.dart';
import 'package:watchhub/utils/constants/text_strings.dart';
import 'package:watchhub/utils/validators/validation.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: AppBar(title: const Text("Re-Authenticate User")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(WatchHubSizes.defaultSpace),
          child: Form(
            key: controller.reAuthFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Email
                TextFormField(
                  controller: controller.verifyEmail,
                  validator: WatchHubValidator.validateEmail,
                  cursorOpacityAnimates: true,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.direct_right),
                    labelText: WatchHubTextStrings.email
                  ),
                ),
                const SizedBox(height: WatchHubSizes.spaceBtwInputFields),

                // Password
                Obx(
                  () => TextFormField(
                    controller: controller.verifyPassword,
                    validator: WatchHubValidator.validatePassword,
                    cursorOpacityAnimates: true,
                    obscureText: controller.hidePassword.value,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Iconsax.password_check),
                      labelText: WatchHubTextStrings.password,
                      suffixIcon: IconButton(
                        icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye),
                        onPressed: () => controller.hidePassword.value = !controller.hidePassword.value
                      )
                    )
                  ),
                ),
                const SizedBox(height: WatchHubSizes.spaceBtwSections),

                /// Login Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => controller.reAuthenticateEmailAndPasswordUser(), 
                    child: const Text("Verify")
                  ),
                )
              ],
            ),
          ),
        )
      ),
    );
  }
}