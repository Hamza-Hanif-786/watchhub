import "package:flutter/material.dart";
import "package:iconsax/iconsax.dart";
import "package:watchhub/common/widgets/texts/wh_brand_title_text.dart";
import "package:watchhub/utils/constants/colors.dart";
import "package:watchhub/utils/constants/enums.dart";
import "package:watchhub/utils/constants/sizes.dart";

class WHBrandTitleWithVerifiedIcon extends StatelessWidget {
  const WHBrandTitleWithVerifiedIcon({
    super.key,
    this.textColor,
    this.maxLines = 1,
    required this.title,
    this.iconColor = WatchHubColors.primary,
    this.textAlign = TextAlign.center,
    this.brandTextSize = TextSizes.small
  });

  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: WHBrandTitleText(
            title: title,
            color: textColor,
            maxLines: maxLines,
            textAlign: textAlign,
            brandTextSize: brandTextSize
          ),
        ),
        const SizedBox(width: WatchHubSizes.xs),
        Icon(Iconsax.verify5, color: iconColor, size: WatchHubSizes.iconXs,)
      ],
    );
  }
}