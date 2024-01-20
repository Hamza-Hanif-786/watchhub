import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:watchhub/common/widgets/appbar/appbar.dart';
import 'package:watchhub/features/personalization/screen/address/add_new_address.dart';
import 'package:watchhub/features/personalization/screen/address/widgets/single_address.dart';
import 'package:watchhub/utils/constants/colors.dart';
import 'package:watchhub/utils/constants/sizes.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: WatchHubColors.primary,
        onPressed: () => Get.to(() => const AddNewAddressScreen(), transition: Transition.fadeIn), 
        child: const Icon(Iconsax.add, color: WatchHubColors.white)
      ),
      appBar: WHAppBar(
        showBackArrow: true,
        title: Text("Addresses", style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(WatchHubSizes.defaultSpace),
          child: Column(
            children: [
              WHSingleAddress(selectedAddress: false),
              WHSingleAddress(selectedAddress: true),
              WHSingleAddress(selectedAddress: false),
            ]
          ),
        ),
      ),
    );
  }
}