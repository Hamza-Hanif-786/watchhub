import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watchhub/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:watchhub/common/widgets/texts/section_heading.dart';
import 'package:watchhub/features/shop/controllers/product/checkout_controller.dart';
import 'package:watchhub/utils/constants/colors.dart';
import 'package:watchhub/utils/constants/sizes.dart';
import 'package:watchhub/utils/helpers/helper_functions.dart';

class WHBillingPaymentSection extends StatelessWidget {
  const WHBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CheckoutController());
    final dark = WatchHubHelperFunctions.isDarkMode(context);

    return Column(
      children: [
        WHSectionHeading(title: "Payment Method", buttonTitle: "Change", onPressed: () => controller.selectPaymentMethod(context)),
        const SizedBox(height: WatchHubSizes.spaceBtwItems / 2),
        Obx(
          () => Row(
            children: [
              WHRoundedContainer(
                width: 60,
                height: 35,
                backgroundColor: dark ? WatchHubColors.light : WatchHubColors.white,
                padding: const EdgeInsets.all(WatchHubSizes.sm),
                child: Image(image: AssetImage(controller.selectedPaymentMethod.value.image), fit: BoxFit.contain),
              ),
              const SizedBox(width: WatchHubSizes.spaceBtwItems / 2),
              Text(controller.selectedPaymentMethod.value.name, style: Theme.of(context).textTheme.bodyLarge)
            ]
          ),
        )
      ],
    );
  }
}