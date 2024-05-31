import "package:flutter/material.dart";
import "package:watchhub/common/widgets/shimmers/shimmer.dart";
import "package:watchhub/utils/constants/sizes.dart";

class WHBoxesShimmer extends StatelessWidget {
  const WHBoxesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Expanded(child: WHShimmerEffect(width: 150, height: 110)),
            SizedBox(width: WatchHubSizes.spaceBtwItems),
            Expanded(child: WHShimmerEffect(width: 150, height: 110)),
            SizedBox(width: WatchHubSizes.spaceBtwItems),
            Expanded(child: WHShimmerEffect(width: 150, height: 110)),
          ],
        )
      ],
    );
  }
}