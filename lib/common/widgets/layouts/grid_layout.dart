import 'package:flutter/material.dart';
import 'package:watchhub/utils/constants/sizes.dart';

class WHGridLayout extends StatelessWidget {
  const WHGridLayout({
    super.key, 
    required this.itemCount, 
    required this.itemBuilder,
    this.mainAxisExtent = 288, 
  });

  final int itemCount;
  final double? mainAxisExtent;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: itemCount,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: WatchHubSizes.gridViewSpacing,
        crossAxisSpacing: WatchHubSizes.gridViewSpacing,
        mainAxisExtent: mainAxisExtent
      ), 
      itemBuilder: itemBuilder,
    );
  }
}