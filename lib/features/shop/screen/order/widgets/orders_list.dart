import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:iconsax/iconsax.dart";
import "package:watchhub/common/widgets/custom_shapes/containers/rounded_container.dart";
import "package:watchhub/common/widgets/loaders/animation_loader.dart";
import "package:watchhub/features/shop/controllers/product/order_controller.dart";
import "package:watchhub/utils/constants/colors.dart";
import "package:watchhub/utils/constants/image_strings.dart";
import "package:watchhub/utils/constants/sizes.dart";
import "package:watchhub/utils/helpers/cloud_helper_functions.dart";
import "package:watchhub/utils/helpers/helper_functions.dart";

class WHOrderListItems extends StatelessWidget {
  const WHOrderListItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = WatchHubHelperFunctions.isDarkMode(context);
    final controller = Get.put(OrderController());

    return FutureBuilder(
      future: controller.fetchUserOrders(),
      builder: (_, snapshot) {
        // nothing found widget 
        final emptyWidget = WHAnimationLoaderWidget(
          text: "Whoops! No Orders Found...",
          animation: WatchHubImages.orderCompletedAnimation
        );

        final response = WHCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, nothingFound: emptyWidget);
        if (response != null) return response;

        // Records Found
        final orders = snapshot.data!;
        return ListView.separated(
          shrinkWrap: true,
          itemCount: orders.length,
          separatorBuilder: (_, __) => const SizedBox(height: WatchHubSizes.spaceBtwItems,),
          itemBuilder:(_, index) {
            final order = orders[index];
            return WHRoundedContainer(
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
                            Text(
                              order.orderStatusText,
                              overflow: TextOverflow.ellipsis, 
                              style: Theme.of(context).textTheme.bodyLarge!.apply(color: WatchHubColors.primary, fontWeightDelta: 1)
                            ),
                            Text(order.formattedOrderDate,style: Theme.of(context).textTheme.headlineSmall),
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
                                  Text("Order", style: Theme.of(context).textTheme.labelMedium, overflow: TextOverflow.ellipsis, maxLines: 1),
                                  Text(order.id,style: Theme.of(context).textTheme.titleMedium, overflow: TextOverflow.ellipsis, maxLines: 1),
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
                                  Text("Shipping Date", style: Theme.of(context).textTheme.labelMedium, overflow: TextOverflow.ellipsis,maxLines: 1),
                                  Text(order.formattedDeliveryDate,style: Theme.of(context).textTheme.titleMedium, overflow: TextOverflow.ellipsis, maxLines: 1),
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
            );
          }
        );
      }
    );
  }
}