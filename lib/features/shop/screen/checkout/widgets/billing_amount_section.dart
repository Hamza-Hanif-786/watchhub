import 'package:flutter/material.dart';
import 'package:watchhub/features/shop/controllers/product/cart_controller.dart';
import 'package:watchhub/utils/constants/sizes.dart';
import 'package:watchhub/utils/helpers/pricing_calculator.dart';

class WHBillingAmountSection extends StatelessWidget {
  const WHBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    final subTotal = cartController.totalCartPrice.value;

    return Column(
      children: [
        /// SubTotal
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Subtotal", style: Theme.of(context).textTheme.bodyMedium),
            Text("\$$subTotal", style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: WatchHubSizes.spaceBtwItems / 2),

        /// Shipping Fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Shipping Fee", style: Theme.of(context).textTheme.bodyMedium),
            Text("\$${WatchHubPricingCalculator.calculateShippingCost(subTotal, "US")}", style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        const SizedBox(height: WatchHubSizes.spaceBtwItems / 2),

        /// Tax Fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Tax Fee", style: Theme.of(context).textTheme.bodyMedium),
            Text("\$${WatchHubPricingCalculator.calculateTax(subTotal, "US")}", style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        const SizedBox(height: WatchHubSizes.spaceBtwItems / 2),

        /// Order Total
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Order Total", style: Theme.of(context).textTheme.bodyMedium),
            Text("\$${WatchHubPricingCalculator.calculateTotalPrice(subTotal, "US")}", style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(height: WatchHubSizes.spaceBtwItems / 2),

      ],
    );
  }
}