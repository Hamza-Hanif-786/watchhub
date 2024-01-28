import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:watchhub/features/authentication/controllers/login/login_controller.dart';
import 'package:watchhub/features/authentication/screen/password_configuration/forget_password.dart';
import 'package:watchhub/features/authentication/screen/signup/signup.dart';
import 'package:watchhub/utils/constants/sizes.dart';
import 'package:watchhub/utils/constants/text_strings.dart';
import 'package:watchhub/utils/validators/validation.dart';

class WHLoginForm extends StatelessWidget {
  const WHLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: WatchHubSizes.spaceBtwSections),
        child: Column(
          children: [

            // Email
            TextFormField(
              controller: controller.email,
              validator: (value) => WatchHubValidator.validateEmail(value),
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
                controller: controller.password,
                validator: (value) => WatchHubValidator.validateEmptyText("Password", value),
                cursorOpacityAnimates: true,
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Iconsax.password_check), 
                  labelText: WatchHubTextStrings.password,
                  suffixIcon: IconButton(
                    icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye), 
                    onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                  ), 
                ),  
              ),
            ),
        
            const SizedBox(height: WatchHubSizes.spaceBtwInputFields / 2),
        
            /// Remember Me & Forgot Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Remember Me
                Row(
                  children: [
                    Obx(
                      () => Checkbox(
                        value: controller.rememberMe.value, 
                        onChanged: (value) => controller.rememberMe.value = !controller.rememberMe.value
                      )
                    ),
                    const Text(WatchHubTextStrings.rememberMe),
                  ]
                ), 
                
                /// Forgot Password
                TextButton(
                  onPressed: () => Get.to(() => const ForgetPassword(), transition: Transition.fade), 
                  child: const Text(WatchHubTextStrings.forgotPassword)
                )
              ],
            ),
        
            const SizedBox(height: WatchHubSizes.spaceBtwSections),
        
            /// Sign In Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.emailAndPasswordSignIn(),
                child: const Text(WatchHubTextStrings.signIn),
              ),
            ),
    
            const SizedBox(height: WatchHubSizes.spaceBtwItems),
        
            /// Create Account  Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Get.to(() => const SignupScreen()),
                child: const Text(WatchHubTextStrings.createAccount),
              ),
            ),
          ]
        ),
      ),
    );
  }
}

