import "package:flutter/material.dart";
import "package:watchhub/common/widgets/appbar/appbar.dart";
import "package:watchhub/common/widgets/images/wh_circular_image.dart";
import "package:watchhub/common/widgets/texts/section_heading.dart";
import "package:watchhub/features/personalization/screen/profile/widgets/profile_menu.dart";
import "package:watchhub/utils/constants/image_strings.dart";
import "package:watchhub/utils/constants/sizes.dart";

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                    const WHCircularImage(image: WatchHubImages.user, width: 80, height: 80),
                    TextButton(onPressed: () {}, child: const Text("Change Profile Picture"))
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

              WHProfileMenu(title: 'Name', value: 'Hamza Hanif', onPressed: () {}),
              WHProfileMenu(title: 'Username', value: 'hamzahanif958', onPressed: () {}),

              const SizedBox(height: WatchHubSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: WatchHubSizes.spaceBtwItems),

              /// Heading Personal Info
              const WHSectionHeading(title: "Personal Information", showActionButton: false),
              const SizedBox(height: WatchHubSizes.spaceBtwItems),

              WHProfileMenu(title: 'User ID', value: '45689703162', onPressed: () {}),
              WHProfileMenu(title: 'E-mail', value: 'hamzahanif1024@gmail.com', onPressed: () {}),
              WHProfileMenu(title: 'Phone Number', value: '+92-321-1124345', onPressed: () {}),
              WHProfileMenu(title: 'Gender', value: 'Male', onPressed: () {}),
              WHProfileMenu(title: 'Date of Birth', value: '06 Apr, 2003', onPressed: () {}),
              const Divider(),
              const SizedBox(height: WatchHubSizes.spaceBtwItems),

              Center(
                child: TextButton(
                  onPressed: () {},
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

