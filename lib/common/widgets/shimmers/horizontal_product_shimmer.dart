import "package:flutter/material.dart";
import "package:watchhub/common/widgets/shimmers/shimmer.dart";
import "package:watchhub/utils/constants/sizes.dart";

class WHHorizontalProductShimmer extends StatelessWidget {
  const WHHorizontalProductShimmer({super.key, this.itemCount = 6});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: WatchHubSizes.spaceBtwSections),
      height: 120,
      child: ListView.separated(
        itemCount: itemCount,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(width: WatchHubSizes.spaceBtwItems),
        itemBuilder: (_, __) => const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // image
            WHShimmerEffect(width: 120, height: 120),
            SizedBox(width: WatchHubSizes.spaceBtwItems),

            // text
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(width: WatchHubSizes.spaceBtwItems / 2),
                WHShimmerEffect(width: 160, height: 15),
                SizedBox(height: WatchHubSizes.spaceBtwItems / 2),
                WHShimmerEffect(width: 110, height: 15),
                SizedBox(height: WatchHubSizes.spaceBtwItems / 2),
                WHShimmerEffect(width: 80, height: 15),
                Spacer()
              ],
            )
          ],
        ) 
         
      ),
    );
  }
}