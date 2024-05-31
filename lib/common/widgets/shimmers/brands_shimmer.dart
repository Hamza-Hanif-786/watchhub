import "package:flutter/material.dart";
import "package:watchhub/common/widgets/layouts/grid_layout.dart";
import "package:watchhub/common/widgets/shimmers/shimmer.dart";

class WHBrandsShimmer extends StatelessWidget {
  const WHBrandsShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return WHGridLayout(
      itemCount: itemCount,
      mainAxisExtent: 80,
      itemBuilder: (_, __) => const WHShimmerEffect(width: 300, height: 80)
    );
  }
}