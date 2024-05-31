import "package:flutter/material.dart";
import "package:watchhub/common/widgets/texts/section_heading.dart";
import "package:watchhub/features/personalization/controllers/address_controller.dart";
import "package:watchhub/utils/constants/sizes.dart";

class WHBillingAddressSection extends StatelessWidget {
  const WHBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final addressController = AddressController.instance;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WHSectionHeading(title: "Shipping Address", buttonTitle: "Change", onPressed: () => addressController.selectNewAddressPopup(context)),
        addressController.selectedAddress.value.id .isNotEmpty ? 
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(addressController.selectedAddress.value.name, style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(height: WatchHubSizes.spaceBtwItems / 2),
            Row(
              children: [
                const Icon(Icons.phone, color: Colors.grey, size: 16),
                const SizedBox(width: WatchHubSizes.spaceBtwItems),
                Text(addressController.selectedAddress.value.formattedPhoneNo, style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
            const SizedBox(height: WatchHubSizes.spaceBtwItems / 2),

            Row(
              children: [
                const Icon(Icons.location_history, color: Colors.grey, size: 16),
                const SizedBox(width: WatchHubSizes.spaceBtwItems),
                Expanded(
                  child: Text(addressController.selectedAddress.value.toString(), style: Theme.of(context).textTheme.bodyMedium, softWrap: true)
                ),
              ],
            ),
            const SizedBox(height: WatchHubSizes.spaceBtwItems / 2),
          ],
        ) : Text('Select Address', style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}