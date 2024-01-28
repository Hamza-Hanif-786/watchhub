import 'package:flutter/material.dart';
import 'package:watchhub/common/widgets/shimmers/shimmer.dart';
import 'package:watchhub/utils/constants/sizes.dart';

class WHCategoryShimmer extends StatelessWidget {
  const WHCategoryShimmer({
    super.key,
    this.itemCount = 7
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: itemCount,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, __) => const SizedBox(width: WatchHubSizes.spaceBtwItems),
        itemBuilder: (_, __) {
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Image
              WHShimmerEffect(width: 55, height: 55, radius: 55),
              SizedBox(height: WatchHubSizes.spaceBtwItems / 2),

              /// Text
              WHShimmerEffect(width: 55, height: 8),
            ],
          );
        },
      ),
    );
  }
}