import "package:flutter/material.dart";
import "package:watchhub/common/widgets/shimmers/shimmer.dart";
import "package:watchhub/utils/constants/sizes.dart";

class WHListTileShimmer extends StatelessWidget {
  const WHListTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            WHShimmerEffect(width: 50, height: 50, radius: 50),
            SizedBox(width: WatchHubSizes.spaceBtwItems),
            Column(
              children: [
                WHShimmerEffect(width: 100, height: 15),
                SizedBox(height: WatchHubSizes.spaceBtwItems / 2),
                WHShimmerEffect(width: 80, height: 12),
              ],
            )
          ],
        )
      ],
    );
  }
}