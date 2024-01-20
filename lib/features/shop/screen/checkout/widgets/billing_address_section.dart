import "package:flutter/material.dart";
import "package:watchhub/common/widgets/texts/section_heading.dart";
import "package:watchhub/utils/constants/sizes.dart";

class WHBillingAddressSection extends StatelessWidget {
  const WHBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WHSectionHeading(title: "Shipping Address", buttonTitle: "Change", onPressed: () {}),
        Text("M.Hamza Hanif", style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: WatchHubSizes.spaceBtwItems / 2),
        Row(
          children: [
            const Icon(Icons.phone, color: Colors.grey, size: 16),
            const SizedBox(width: WatchHubSizes.spaceBtwItems),
            Text("+92-300-1234567", style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: WatchHubSizes.spaceBtwItems / 2),

        Row(
          children: [
            const Icon(Icons.location_history, color: Colors.grey, size: 16),
            const SizedBox(width: WatchHubSizes.spaceBtwItems),
            Expanded(
              child: Text("Aptech Metro StarGate, Karachi, Pakistan", style: Theme.of(context).textTheme.bodyMedium, softWrap: true)
            ),
          ],
        ),
        const SizedBox(height: WatchHubSizes.spaceBtwItems / 2),
      ],
    );
  }
}