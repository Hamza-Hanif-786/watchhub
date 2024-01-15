import 'package:flutter/material.dart';
import 'package:watchhub/common/widgets/appbar/appbar.dart';
import 'package:watchhub/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:watchhub/utils/constants/colors.dart';
import 'package:watchhub/utils/constants/text_strings.dart';

class WHHomeAppBar extends StatelessWidget {
  const WHHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return WHAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(WatchHubTextStrings.homeAppbarTitle, style: Theme.of(context).textTheme.labelMedium!.apply(color: WatchHubColors.grey)),
          Text(WatchHubTextStrings.homeAppbarSubTitle, style: Theme.of(context).textTheme.headlineSmall!.apply(color: WatchHubColors.white)),
        ],
      ),
      actions: [
        WHCartCounterIcon(
          onPressed: () {},
          iconColor: WatchHubColors.white,
        )
      ],
    );
  }
}