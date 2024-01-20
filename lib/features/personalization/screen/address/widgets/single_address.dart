import "package:flutter/material.dart";
import "package:iconsax/iconsax.dart";
import "package:watchhub/common/widgets/custom_shapes/containers/rounded_container.dart";
import "package:watchhub/utils/constants/colors.dart";
import "package:watchhub/utils/constants/sizes.dart";
import "package:watchhub/utils/helpers/helper_functions.dart";

class WHSingleAddress extends StatelessWidget {
  const WHSingleAddress({
    super.key, 
    required this.selectedAddress
  });

  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    final dark = WatchHubHelperFunctions.isDarkMode(context);

    return WHRoundedContainer(
      width: double.infinity,
      showBorder: true,
      padding: const EdgeInsets.all(WatchHubSizes.md),
      backgroundColor: selectedAddress ? WatchHubColors.primary.withOpacity(0.5) : Colors.transparent,
      borderColor: selectedAddress ? Colors.transparent : dark ? WatchHubColors.darkerGrey : WatchHubColors.grey,
      margin: const EdgeInsets.only(bottom: WatchHubSizes.spaceBtwItems),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 5,
            child: Icon(
              selectedAddress ? Iconsax.tick_circle5 : null,
              color: selectedAddress ? dark ? WatchHubColors.light : WatchHubColors.dark.withOpacity(0.6) : null,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Muhammad Hamza Hanif",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge
              ),
              const SizedBox(height: WatchHubSizes.sm / 2),
              const Text("+92-321-1124345", maxLines: 1, overflow: TextOverflow.ellipsis),
              const SizedBox(height: WatchHubSizes.sm / 2),
              const Text("Aptech Metro Star Gate, Karachi, Pakistan", softWrap: true),
            ]
          )
        ],
      ),
    );
  }
}