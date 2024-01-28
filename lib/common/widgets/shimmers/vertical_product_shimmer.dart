import "package:flutter/material.dart";
import "package:watchhub/common/widgets/layouts/grid_layout.dart";
import "package:watchhub/common/widgets/shimmers/shimmer.dart";
import "package:watchhub/utils/constants/sizes.dart";

class WHVerticalProductShimmer extends StatelessWidget {
  const WHVerticalProductShimmer({
    super.key,
    this.itemCount = 4
    });

    final int itemCount;

  @override
  Widget build(BuildContext context) {
    return WHGridLayout(
      itemCount: itemCount, 
      itemBuilder: (_, __) => const SizedBox(
        width: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            WHShimmerEffect(width: 180, height: 180),
            SizedBox(height: WatchHubSizes.spaceBtwItems),

            // Text
            WHShimmerEffect(width: 160, height: 15),
            SizedBox(height: WatchHubSizes.spaceBtwItems / 2),
            WHShimmerEffect(width: 110, height: 15),
          ],
        ),
      )
    );
  }
}