import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:iconsax/iconsax.dart";
import "package:watchhub/features/shop/screen/home/home.dart";
import "package:watchhub/features/shop/screen/store/store.dart";
import "package:watchhub/utils/constants/colors.dart";
import "package:watchhub/utils/helpers/helper_functions.dart";

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = WatchHubHelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) => controller.selectedIndex.value = index,
          backgroundColor: darkMode ? WatchHubColors.black : Colors.white,
          indicatorColor: darkMode ? WatchHubColors.white.withOpacity(0.1) : WatchHubColors.black.withOpacity(0.1),
          destinations: const [
            NavigationDestination(
              icon: Icon(Iconsax.home),
              label: "Home"
            ),
            NavigationDestination(
              icon: Icon(Iconsax.shop),
              label: "Shop"
            ),
            NavigationDestination(
              icon: Icon(Iconsax.heart),
              label: "Wishlist"
            ),
            NavigationDestination(
              icon: Icon(Iconsax.user),
              label: "Profile"
            )
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController{
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomeScreen(),
    const StoreScreen(),
    Container(color: Colors.yellow),
    Container(color: Colors.red),
  ];
}