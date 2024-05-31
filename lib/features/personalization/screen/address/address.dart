import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:watchhub/common/widgets/appbar/appbar.dart';
import 'package:watchhub/features/personalization/controllers/address_controller.dart';
import 'package:watchhub/features/personalization/screen/address/add_new_address.dart';
import 'package:watchhub/features/personalization/screen/address/widgets/single_address.dart';
import 'package:watchhub/utils/constants/colors.dart';
import 'package:watchhub/utils/constants/sizes.dart';
import 'package:watchhub/utils/helpers/cloud_helper_functions.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());

    return Scaffold(
      appBar: WHAppBar(showBackArrow: true, title: Text("Addresses", style: Theme.of(context).textTheme.headlineSmall)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(WatchHubSizes.defaultSpace),
          child: Obx(
            () => FutureBuilder(
              key: Key(controller.refreshData.toString()),
              future: controller.getAllUserAddresses(),
              builder: (context, snapshot) {
            
                // Handle loader , No record and error message 
                final response = WHCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot);
                if (response != null) return response;
            
                final addresses = snapshot.data!;
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: addresses.length,
                  itemBuilder: (_,index) => WHSingleAddress(
                    address: addresses[index], 
                    onTap: () => controller.selectAddress(addresses[index])
                  )
                  
                );
              }
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: WatchHubColors.primary,
        onPressed: () => Get.to(() => const AddNewAddressScreen(), transition: Transition.fadeIn), 
        child: const Icon(Iconsax.add, color: WatchHubColors.white)
      ),
    );
  }
}