import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:iconsax/iconsax.dart";
import "package:watchhub/common/widgets/custom_shapes/containers/rounded_container.dart";
import "package:watchhub/features/personalization/controllers/address_controller.dart";
import "package:watchhub/features/personalization/models/address_model.dart";
import "package:watchhub/utils/constants/colors.dart";
import "package:watchhub/utils/constants/sizes.dart";
import "package:watchhub/utils/helpers/helper_functions.dart";

class WHSingleAddress extends StatelessWidget {
  const WHSingleAddress({
    super.key, 
    required this.address, 
    required this.onTap, 
  });

  final AddressModel address;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;
    final dark = WatchHubHelperFunctions.isDarkMode(context);

    return Obx(() { 
      final selectedAddressId = controller.selectedAddress.value.id;
      final selectedAddress = address.id == selectedAddressId;
      return InkWell(
        onTap: onTap,
        child: WHRoundedContainer(
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
                    address.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleLarge
                  ),
                  const SizedBox(height: WatchHubSizes.sm / 2),
                  Text(address.formattedPhoneNo, maxLines: 1, overflow: TextOverflow.ellipsis),
                  const SizedBox(height: WatchHubSizes.sm / 2),
                  Text(address.toString(), softWrap: true),
                ]
              )
            ],
          ),
        ),
      ); }
    );
  }
}