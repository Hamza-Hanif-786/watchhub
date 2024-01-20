import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:watchhub/common/widgets/images/wh_circular_image.dart';
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
    return ListTile(
      leading: const WHCircularImage(
        image: WatchHubImages.user, 
        width: 50, 
        height: 50,
        padding: 0,
        backgroundColor: WatchHubColors.white
      ),
      title: Text("Hamza Hanif", style: Theme.of(context).textTheme.headlineSmall!.apply(color: WatchHubColors.white)),
      subtitle: Text("hamzahanif1024@gmail.com", style: Theme.of(context).textTheme.bodyMedium!.apply(color: WatchHubColors.white)),
      trailing: IconButton(onPressed: onPressed, icon: const Icon(Iconsax.edit, color: WatchHubColors.white)),
    );
  }
}