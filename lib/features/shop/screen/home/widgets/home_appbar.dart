import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watchhub/common/widgets/appbar/appbar.dart';
import 'package:watchhub/common/widgets/shimmers/shimmer.dart';
import 'package:watchhub/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:watchhub/features/personalization/controllers/user_controller.dart';
import 'package:watchhub/utils/constants/colors.dart';
import 'package:watchhub/utils/constants/text_strings.dart';

class WHHomeAppBar extends StatelessWidget {
  const WHHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());

    return WHAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(WatchHubTextStrings.homeAppbarTitle, style: Theme.of(context).textTheme.labelMedium!.apply(color: WatchHubColors.grey)),
          Obx(
            () { 
              if (controller.profileLoading.value) {
                // Display a shimmer loader while user profile is biend loaded
                return const WHShimmerEffect(width: 80, height: 15);
              } else {
                return Text(
                  controller.user.value.fullName, 
                  style: Theme.of(context).textTheme.headlineSmall!.apply(color: WatchHubColors.white)
                );
              } 
            },
          ),
        ],
      ),
      actions: const [
        WHCartCounterIcon(
          iconColor: WatchHubColors.white,
        )
      ],
    );
  }
}