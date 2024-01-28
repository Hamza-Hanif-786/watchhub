import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:iconsax/iconsax.dart";
import "package:watchhub/common/widgets/appbar/appbar.dart";
import "package:watchhub/common/widgets/images/wh_circular_image.dart";
import 'package:watchhub/common/widgets/shimmers/shimmer.dart';
import "package:watchhub/common/widgets/texts/section_heading.dart";
import "package:watchhub/features/personalization/controllers/user_controller.dart";
import "package:watchhub/features/personalization/screen/profile/widgets/change_name.dart";
import "package:watchhub/features/personalization/screen/profile/widgets/profile_menu.dart";
import "package:watchhub/utils/constants/image_strings.dart";
import "package:watchhub/utils/constants/sizes.dart";

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;

    return Scaffold(
      appBar: const WHAppBar(showBackArrow: true, title: Text("Profile")),

      /// -- Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(WatchHubSizes.defaultSpace),
          child: Column(
            children: [
              /// Profile Picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(
                      () { 
                        final networkImage = controller.user.value.profilePicture;
                        final image = networkImage.isNotEmpty ? networkImage : WatchHubImages.user;
                        return controller.imageUploading.value
                          ? const WHShimmerEffect(width: 80, height: 80, radius: 80)
                          : WHCircularImage(
                            image: image, 
                            width: 80, 
                            height: 80,
                            isNetworkImage: networkImage.isNotEmpty
                          ); 
                      }
                    ),
                    TextButton(onPressed: () => controller.uploadUserProfilePicture(), child: const Text("Change Profile Picture"))
                  ],
                ),
              ),

              /// Deatails
              const SizedBox(height: WatchHubSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: WatchHubSizes.spaceBtwItems),

              /// Heading Profile Info
              const WHSectionHeading(title: "Profile Information", showActionButton: false),
              const SizedBox(height: WatchHubSizes.spaceBtwItems),

              WHProfileMenu(title: 'Name', value: controller.user.value.fullName, onPressed: () => Get.to(() => const ChangeName())),
              WHProfileMenu(title: 'Username', value: controller.user.value.username, onPressed: () {}),

              const SizedBox(height: WatchHubSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: WatchHubSizes.spaceBtwItems),

              /// Heading Personal Info
              const WHSectionHeading(title: "Personal Information", showActionButton: false),
              const SizedBox(height: WatchHubSizes.spaceBtwItems),

              WHProfileMenu(title: 'User ID', value: controller.user.value.id, icon: Iconsax.copy, onPressed: () {}),
              WHProfileMenu(title: 'E-mail', value: controller.user.value.email, onPressed: () {}),
              WHProfileMenu(title: 'Phone Number', value: controller.user.value.phoneNumber, onPressed: () {}),
              WHProfileMenu(title: 'Gender', value: 'Male', onPressed: () {}),
              WHProfileMenu(title: 'Date of Birth', value: '06 Apr, 2003', onPressed: () {}),
              const Divider(),
              const SizedBox(height: WatchHubSizes.spaceBtwItems),

              Center(
                child: TextButton(
                  onPressed: () => controller.deleteAccountWarningPopup(),
                  child: const Text("Close Account", style: TextStyle(color: Colors.red)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

