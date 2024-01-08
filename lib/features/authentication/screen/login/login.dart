import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watchhub/common/style/spacing_styles.dart';
import 'package:watchhub/common/widgets/login_signup/form_divider.dart';
import 'package:watchhub/common/widgets/login_signup/social_buttons.dart';
import 'package:watchhub/features/authentication/screen/login/widgets/login_form.dart';
import 'package:watchhub/features/authentication/screen/login/widgets/login_header.dart';
import 'package:watchhub/utils/constants/sizes.dart';
import 'package:watchhub/utils/constants/text_strings.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: WatchHubSpacingStyles.paddingWithAppBarHeight,
          child: Column(
            children: [

              /// Logo, title and subtitle
              const WHLoginHeader(),

              /// Login Form
              const WHLoginForm(),

              /// Divider
              WHFormDivider(dividerText: WatchHubTextStrings.orSignInWith.capitalize!,),
              const SizedBox(height: WatchHubSizes.spaceBtwSections),

              /// Footer
              const WHSocialButtons()
            ]
          ),
        ),
      ),
    );
  }
}
