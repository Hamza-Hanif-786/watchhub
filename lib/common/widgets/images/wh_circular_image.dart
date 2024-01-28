import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:watchhub/common/widgets/shimmers/shimmer.dart';
import 'package:watchhub/utils/constants/colors.dart';
import 'package:watchhub/utils/constants/sizes.dart';
import 'package:watchhub/utils/helpers/helper_functions.dart';

class WHCircularImage extends StatelessWidget {
  const WHCircularImage({
    super.key,
    this.width = 56,
    this.height = 56,
    this.overlayColor,
    this.backgroundColor,
    required this.image,
    this.fit = BoxFit.cover,
    this.padding = WatchHubSizes.sm,
    this.isNetworkImage = false,
  });

  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double width, height, padding;

  @override
  Widget build(BuildContext context) {
    final dark = WatchHubHelperFunctions.isDarkMode(context);

    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor ?? (dark ? WatchHubColors.black : WatchHubColors.white),
        borderRadius: BorderRadius.circular(100)
      ),
      child: ClipOval(
        child: Center(
          child: isNetworkImage
            ? CachedNetworkImage(
              fit: fit,
              color: overlayColor,
              imageUrl: image,
              progressIndicatorBuilder: (context, url, downloadProgress) => const WHShimmerEffect(width: 55, height: 55, radius: 55,),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            )
            : Image(
              fit: fit,
              image: isNetworkImage ? NetworkImage(image) : AssetImage(image) as ImageProvider,
              color: overlayColor,
            ),
        ),
      ),
    );
  }
}