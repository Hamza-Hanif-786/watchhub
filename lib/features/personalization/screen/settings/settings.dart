import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:iconsax/iconsax.dart";
import "package:watchhub/common/widgets/appbar/appbar.dart";
import "package:watchhub/common/widgets/custom_shapes/containers/primary_header_container.dart";
import "package:watchhub/common/widgets/list_tiles/settings_menu_tile.dart";
import "package:watchhub/common/widgets/list_tiles/user_profile_tile.dart";
import "package:watchhub/common/widgets/texts/section_heading.dart";
import "package:watchhub/data/repositories/authentication/authentication_repository.dart";
import "package:watchhub/features/personalization/screen/address/address.dart";
import "package:watchhub/features/personalization/screen/profile/profile.dart";
import "package:watchhub/features/shop/screen/cart/cart.dart";
import "package:watchhub/features/shop/screen/order/order.dart";
import "package:watchhub/utils/constants/colors.dart";
import "package:watchhub/utils/constants/sizes.dart";

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// -- Header
            WHPrimaryHeaderContainer(
              child: Column(
                children: [
                  // Appbar
                  WHAppBar(title: Text("Account", style: Theme.of(context).textTheme.headlineMedium!.apply(color: WatchHubColors.white))),

                  // User Profile Card
                  WHUserProfileTile(onPressed: () => Get.to(() => const ProfileScreen(), transition: Transition.fadeIn)),
                  const SizedBox(height: WatchHubSizes.spaceBtwSections),
                ],
              )
            ), 
            
            /// -- Body
            Padding(
              padding: const EdgeInsets.all(WatchHubSizes.defaultSpace),
              child: Column(
                children: [
                  /// -- Account Settings
                  const WHSectionHeading(title: "Account Settings", showActionButton: false),
                  const SizedBox(height: WatchHubSizes.spaceBtwItems),

                  WHSettingsMenuTile(
                    icon: Iconsax.safe_home, 
                    title: "My Addresses", 
                    subtitle: "Set shopping delivery address", 
                    onTap: () => Get.to(() => const UserAddressScreen(), transition: Transition.fadeIn)
                  ),
                  WHSettingsMenuTile(
                    icon: Iconsax.shopping_cart, 
                    title: "My Cart", 
                    subtitle: "Add, remove products and move to checkout",
                    onTap: () => Get.to(() => const CartScreen(), transition: Transition.fadeIn)
                  ),
                  WHSettingsMenuTile(
                    icon: Iconsax.bag_tick, 
                    title: "My Orders", 
                    subtitle: "In-progress and Completed Orders", 
                    onTap: () => Get.to(() => const OrderScreen(), transition: Transition.fadeIn)
                  ),
                  const WHSettingsMenuTile(
                    icon: Iconsax.bank, 
                    title: "Bank Account", 
                    subtitle: "Withdraw balance to registered bank account"
                  ),
                  const WHSettingsMenuTile(
                    icon: Iconsax.discount_shape, 
                    title: "My Coupons", 
                    subtitle: "List of all the discounted coupons"
                  ),
                  const WHSettingsMenuTile(
                    icon: Iconsax.notification, 
                    title: "Notifications", 
                    subtitle: "Set any kind of notification message"
                  ),
                  const WHSettingsMenuTile(
                    icon: Iconsax.security_card, 
                    title: "Account Privacy", 
                    subtitle: "Manage data usage and connected accounts"
                  ),

                  /// -- App Settings
                  const SizedBox(height: WatchHubSizes.spaceBtwSections),
                  const WHSectionHeading(title: "App Settings", showActionButton: false),
                  const SizedBox(height: WatchHubSizes.spaceBtwItems),
                  const WHSettingsMenuTile(
                    icon: Iconsax.document_upload, 
                    title: "Load Data", 
                    subtitle: "Upload Data to your Cloud Firebase"
                  ),
                  WHSettingsMenuTile(
                    icon: Iconsax.location, 
                    title: "Geolocation", 
                    subtitle: "Set recommendation based on location",
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),
                  WHSettingsMenuTile(
                    icon: Iconsax.security_user, 
                    title: "Safe Mode", 
                    subtitle: "Search result is safe for all ages",
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),
                  WHSettingsMenuTile(
                    icon: Iconsax.image, 
                    title: "HD Image Quality", 
                    subtitle: "Set image quality to be seen",
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),
                  
                  /// -- Logout Button
                  const SizedBox(height: WatchHubSizes.spaceBtwSections),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () => AuthenticationRepository.instance.logout(), 
                      child: const Text("Logout")
                    ),
                  ),
                  const SizedBox(height: WatchHubSizes.spaceBtwSections * 2.5),
                ]
              ),
            )
          ],
        ),
      ),
    );
  }
}

