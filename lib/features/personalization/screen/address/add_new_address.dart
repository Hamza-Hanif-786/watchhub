import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:watchhub/common/widgets/appbar/appbar.dart';
import 'package:watchhub/features/personalization/controllers/address_controller.dart';
import 'package:watchhub/utils/constants/sizes.dart';
import 'package:watchhub/utils/validators/validation.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;

    return Scaffold(
      appBar: const WHAppBar(showBackArrow: true, title: Text("Add New Address")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(WatchHubSizes.defaultSpace),
          child: Form(
            key: controller.addressFormKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: controller.name,
                  validator: (value) => WatchHubValidator.validateEmptyText('Name', value),
                  cursorOpacityAnimates: true,
                  decoration: const InputDecoration( prefixIcon: Icon(Iconsax.user), labelText: "Name")
                ),
                const SizedBox(height: WatchHubSizes.spaceBtwInputFields),
                TextFormField(
                  controller: controller.phoneNumber,
                  validator: (value) => WatchHubValidator.validatePhoneNumber(value),
                  cursorOpacityAnimates: true,
                  decoration: const InputDecoration( prefixIcon: Icon(Iconsax.mobile), labelText: "Phone Number")
                ),
                const SizedBox(height: WatchHubSizes.spaceBtwInputFields),
                Row(
                  children: [
                    Expanded(child: TextFormField(
                      controller: controller.street,
                      validator: (value) => WatchHubValidator.validateEmptyText('Street', value),
                      cursorOpacityAnimates: true,
                      decoration: const InputDecoration( prefixIcon: Icon(Iconsax.building_31), labelText: "Street")
                    )),
                    const SizedBox(width: WatchHubSizes.spaceBtwInputFields),
                    Expanded(child: TextFormField(
                      controller: controller.postalCode,
                      validator: (value) => WatchHubValidator.validateEmptyText('Postal Code', value),
                      cursorOpacityAnimates: true,
                      decoration: const InputDecoration( prefixIcon: Icon(Iconsax.code), labelText: "Postal Code")
                    )),
                  ],
                ),
                const SizedBox(height: WatchHubSizes.spaceBtwInputFields),
                Row(
                  children: [
                    Expanded(child: TextFormField(
                      controller: controller.city,
                      validator: (value) => WatchHubValidator.validateEmptyText('City', value),
                      decoration: const InputDecoration( prefixIcon: Icon(Iconsax.building), labelText: "City")
                    )),
                    const SizedBox(width: WatchHubSizes.spaceBtwInputFields),
                    Expanded(child: TextFormField(
                      controller: controller.state,
                      validator: (value) => WatchHubValidator.validateEmptyText('State', value),
                      cursorOpacityAnimates: true,
                      decoration: const InputDecoration( prefixIcon: Icon(Iconsax.activity), labelText: "State")
                    )),
                  ],
                ),
                const SizedBox(height: WatchHubSizes.spaceBtwInputFields),
                TextFormField(
                  controller: controller.country,
                  validator: (value) => WatchHubValidator.validateEmptyText('Country', value),
                  cursorOpacityAnimates: true,
                  decoration: const InputDecoration( prefixIcon: Icon(Iconsax.global), labelText: "Country")
                ),
                const SizedBox(height: WatchHubSizes.defaultSpace),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => controller.addNewAddress(), 
                    child: const Text("Save")
                  ),
                )
              ],
            )
          ),
        ),
      ),
    );
  }
}