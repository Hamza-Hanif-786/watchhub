import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:watchhub/common/widgets/images/wh_circular_image.dart';
import 'package:watchhub/common/widgets/shimmers/shimmer.dart';
import 'package:watchhub/features/personalization/controllers/user_controller.dart';
import 'package:watchhub/utils/constants/colors.dart';
import 'package:watchhub/utils/constants/image_strings.dart';

class WHUserProfileTile extends StatelessWidget {
  const WHUserProfileTile({
    super.key,
    required this.onPressed
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;

    return ListTile(
      leading: Obx(
        (){ 
            final networkImage = controller.user.value.profilePicture;
            final image = networkImage.isNotEmpty ? networkImage : WatchHubImages.user;
            return controller.imageUploading.value
              ? const WHShimmerEffect(width: 50, height: 50, radius: 50)
              : WHCircularImage(
                  image: image, 
                  width: 50, 
                  height: 50,
                  padding: 0,
                  isNetworkImage: networkImage.isNotEmpty
              ); 
          }
        ), 
      title: Text(controller.user.value.fullName, style: Theme.of(context).textTheme.headlineSmall!.apply(color: WatchHubColors.white)),
      subtitle: Text(controller.user.value.email, style: Theme.of(context).textTheme.bodyMedium!.apply(color: WatchHubColors.white)),
      trailing: IconButton(onPressed: onPressed, icon: const Icon(Iconsax.edit, color: WatchHubColors.white)),
    );
  }
}