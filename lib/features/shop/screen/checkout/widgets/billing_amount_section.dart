import 'package:flutter/material.dart';
import 'package:watchhub/utils/constants/sizes.dart';

class WHBillingAmountSection extends StatelessWidget {
  const WHBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// SubTotal
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Subtotal", style: Theme.of(context).textTheme.bodyMedium),
            Text("\$600", style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: WatchHubSizes.spaceBtwItems / 2),

        /// Shipping Fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Shipping Fee", style: Theme.of(context).textTheme.bodyMedium),
            Text("\$10.0", style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        const SizedBox(height: WatchHubSizes.spaceBtwItems / 2),

        /// Tax Fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Tax Fee", style: Theme.of(context).textTheme.bodyMedium),
            Text("\$5.0", style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        const SizedBox(height: WatchHubSizes.spaceBtwItems / 2),

        /// Order Total
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Order Total", style: Theme.of(context).textTheme.bodyMedium),
            Text("\$615.0", style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(height: WatchHubSizes.spaceBtwItems / 2),

      ],
    );
  }
}