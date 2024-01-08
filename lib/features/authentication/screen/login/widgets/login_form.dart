import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:watchhub/features/authentication/screen/password_configuration/forget_password.dart';
import 'package:watchhub/features/authentication/screen/signup/signup.dart';
import 'package:watchhub/navigation_menu.dart';
import 'package:watchhub/utils/constants/sizes.dart';
import 'package:watchhub/utils/constants/text_strings.dart';

class WHLoginForm extends StatelessWidget {
  const WHLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: WatchHubSizes.spaceBtwSections),
        child: Column(
          children: [
            // Email
            TextFormField(
              cursorOpacityAnimates: true,
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right), 
                labelText: WatchHubTextStrings.email
              ),
            ),
        
            const SizedBox(height: WatchHubSizes.spaceBtwInputFields),
        
            // Password
            TextFormField(
              cursorOpacityAnimates: true,
              obscureText: true,
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.password_check), 
                labelText: WatchHubTextStrings.password,
                suffixIcon: Icon(Iconsax.eye_slash), 
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
                    Checkbox(value: true, onChanged: (value) {}),
                    const Text(WatchHubTextStrings.rememberMe),
                  ]
                ), 
                
                /// Forgot Password
                TextButton(onPressed: () => Get.to(() => const ForgetPassword(), transition: Transition.fade), child: const Text(WatchHubTextStrings.forgotPassword))
              ],
            ),
        
            const SizedBox(height: WatchHubSizes.spaceBtwSections),
        
            /// Sign In Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.to(() => const NavigationMenu()),
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

