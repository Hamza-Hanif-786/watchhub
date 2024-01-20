import "package:flutter/material.dart";
import "package:iconsax/iconsax.dart";
import "package:watchhub/common/widgets/custom_shapes/containers/rounded_container.dart";
import "package:watchhub/utils/constants/colors.dart";
import "package:watchhub/utils/constants/sizes.dart";
import "package:watchhub/utils/helpers/helper_functions.dart";

class WHOrderListItems extends StatelessWidget {
  const WHOrderListItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = WatchHubHelperFunctions.isDarkMode(context);

    return ListView.separated(
      shrinkWrap: true,
      itemCount: 4,
      separatorBuilder: (_, __) => const SizedBox(height: WatchHubSizes.spaceBtwItems,),
      itemBuilder:(_, index) => WHRoundedContainer(
        showBorder: true,
        padding: const EdgeInsets.all(WatchHubSizes.md),
        backgroundColor: dark ? WatchHubColors.dark : WatchHubColors.light,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// -- Row 1
            Row(
              children: [
                /// 1 - Icon
                const Icon(Iconsax.ship),
                const SizedBox(width: WatchHubSizes.spaceBtwItems / 2),
      
                /// 2 - Status & Date
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Processing", style: Theme.of(context).textTheme.bodyLarge!.apply(color: WatchHubColors.primary, fontWeightDelta: 1)),
                      Text("04 Jan, 2024",style: Theme.of(context).textTheme.headlineSmall),
                    ],
                  ),
                ),
      
                /// 3 - IconButton
                IconButton(onPressed: () {}, icon: const Icon(Iconsax.arrow_right_34, size: WatchHubSizes.iconSm,))
              ],
            ),
            const SizedBox(height: WatchHubSizes.spaceBtwItems),
            
            /// -- Row 2
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      /// 1 - Icon
                      const Icon(Iconsax.tag),
                      const SizedBox(width: WatchHubSizes.spaceBtwItems / 2),
                  
                      /// 2 - Status & Date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Order", style: Theme.of(context).textTheme.labelMedium),
                            Text("[#256f3]",style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
      
                Expanded(
                  child: Row(
                    children: [
                      /// 1 - Icon
                      const Icon(Iconsax.calendar),
                      const SizedBox(width: WatchHubSizes.spaceBtwItems / 2),
                  
                      /// 2 - Status & Date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Shipping Date", style: Theme.of(context).textTheme.labelMedium),
                            Text("06 Jan, 2024",style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}