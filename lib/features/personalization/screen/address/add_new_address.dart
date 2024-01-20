import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:watchhub/common/widgets/appbar/appbar.dart';
import 'package:watchhub/utils/constants/sizes.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const WHAppBar(showBackArrow: true, title: Text("Add New Address")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(WatchHubSizes.defaultSpace),
          child: Form(
            child: Column(
              children: [
                TextFormField(decoration: const InputDecoration( prefixIcon: Icon(Iconsax.user), labelText: "Name")),
                const SizedBox(height: WatchHubSizes.spaceBtwInputFields),
                TextFormField(decoration: const InputDecoration( prefixIcon: Icon(Iconsax.mobile), labelText: "Phone Number")),
                const SizedBox(height: WatchHubSizes.spaceBtwInputFields),
                Row(
                  children: [
                    Expanded(child: TextFormField(decoration: const InputDecoration( prefixIcon: Icon(Iconsax.building_31), labelText: "Street"))),
                    const SizedBox(width: WatchHubSizes.spaceBtwInputFields),
                    Expanded(child: TextFormField(decoration: const InputDecoration( prefixIcon: Icon(Iconsax.code), labelText: "Postal Code"))),
                  ],
                ),
                const SizedBox(height: WatchHubSizes.spaceBtwInputFields),
                Row(
                  children: [
                    Expanded(child: TextFormField(decoration: const InputDecoration( prefixIcon: Icon(Iconsax.building), labelText: "City"))),
                    const SizedBox(width: WatchHubSizes.spaceBtwInputFields),
                    Expanded(child: TextFormField(decoration: const InputDecoration( prefixIcon: Icon(Iconsax.activity), labelText: "State"))),
                  ],
                ),
                const SizedBox(height: WatchHubSizes.spaceBtwInputFields),
                TextFormField(decoration: const InputDecoration( prefixIcon: Icon(Iconsax.global), labelText: "Country")),
                const SizedBox(height: WatchHubSizes.defaultSpace),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(onPressed: () {}, child: const Text("Save")),
                )
              ],
            )
          ),
        ),
      ),
    );
  }
}