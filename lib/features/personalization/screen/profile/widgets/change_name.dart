import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:watchhub/common/widgets/appbar/appbar.dart';
import 'package:watchhub/features/personalization/controllers/update_name_controller.dart';
import 'package:watchhub/utils/constants/sizes.dart';
import 'package:watchhub/utils/constants/text_strings.dart';
import 'package:watchhub/utils/validators/validation.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());

    return Scaffold(
      appBar: WHAppBar(
        showBackArrow: true,
        title: Text('Change Name', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Padding(
        padding: const EdgeInsets.all(WatchHubSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Heading
            Text(
              'Use real name for easy verification. This name will appear on several pages.',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: WatchHubSizes.spaceBtwSections),

            /// Text Fields and Button
            Form(
              key: controller.updateUserNameFormKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.firstName,
                    validator: (value) => WatchHubValidator.validateEmptyText('First name', value),
                    expands: false,
                    cursorOpacityAnimates: true,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.user),
                      labelText: WatchHubTextStrings.firstName
                    ),
                  ),
                  const SizedBox(height: WatchHubSizes.spaceBtwInputFields),
                  TextFormField(
                    controller: controller.lastName,
                    validator: (value) => WatchHubValidator.validateEmptyText('Last name', value),
                    expands: false,
                    cursorOpacityAnimates: true,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.user),
                      labelText: WatchHubTextStrings.lastName
                    )
                  )
                ]
              )
            ),

            const SizedBox(height: WatchHubSizes.spaceBtwSections),

            /// Save Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: () => controller.updateUserName(), child: const Text("Save"))
            )
          ],
        ),
      ),
    );
  }
}