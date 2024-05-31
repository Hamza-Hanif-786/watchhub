import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:watchhub/common/widgets/texts/section_heading.dart";
import "package:watchhub/data/repositories/address/address_repository.dart";
import "package:watchhub/features/personalization/models/address_model.dart";
import "package:watchhub/features/personalization/screen/address/add_new_address.dart";
import "package:watchhub/features/personalization/screen/address/widgets/single_address.dart";
import "package:watchhub/utils/constants/image_strings.dart";
import "package:watchhub/utils/constants/sizes.dart";
import "package:watchhub/utils/helpers/cloud_helper_functions.dart";
import "package:watchhub/utils/helpers/network_manager.dart";
import "package:watchhub/utils/popups/full_screen_loader.dart";
import "package:watchhub/utils/popups/loaders.dart";

class AddressController extends GetxController {
  static AddressController get instance => Get.find();

  final name = TextEditingController();
  final phoneNumber = TextEditingController();
  final street = TextEditingController();
  final city = TextEditingController();
  final state = TextEditingController();
  final postalCode = TextEditingController();
  final country = TextEditingController();
  GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();

  RxBool refreshData = true.obs;
  final Rx<AddressModel> selectedAddress = AddressModel.empty().obs;
  final addressRepository = Get.put(AddressRepository());

  // Fetch all user specific addresses
  Future<List<AddressModel>> getAllUserAddresses() async {
    try {
      final addresses = await addressRepository.fetchUserAddresses();
      selectedAddress.value = addresses.firstWhere((element) => element.selectedAddress, orElse: () => AddressModel.empty());
      return addresses;
    } catch (e) {
      WHLoaders.errorSnackBar(title: 'Address Not Found!', message: e.toString());
      return [];
    }
  }

  // Select Address
  Future selectAddress(AddressModel newSelectedAddress) async {
    try {
      // Clear the "selected" field
      if (selectedAddress.value.id.isNotEmpty) {
        await addressRepository.updateSelectedField(selectedAddress.value.id, false);
      }

      // Assign selected address
      newSelectedAddress.selectedAddress = true;
      selectedAddress.value = newSelectedAddress;

      // Set the "selected" field to true for the newly selected address
      await addressRepository.updateSelectedField(selectedAddress.value.id, true);
      
      Get.back();
    } catch (e) {
      WHLoaders.errorSnackBar(title: 'Error in Selection', message: e.toString());
    }
  }

  // Add New Address
  Future addNewAddress() async {
    try {
      // Start Loading
      WHFullScreenLoader.openLoadingDialog("Storing Address....", WatchHubImages.docerAnimation);  

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        WHFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!addressFormKey.currentState!.validate()) {
        WHFullScreenLoader.stopLoading();
        return;
      }

      // Save Address Data
      final address = AddressModel(
        id: '',
        name: name.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        street: street.text.trim(),
        city: city.text.trim(),
        state: state.text.trim(),
        postalCode: postalCode.text.trim(),
        country: country.text.trim(),
        selectedAddress: true,
      );
      final id = await addressRepository.addAddress(address);

      // Update Selected Address status
      address.id = id;
      await selectAddress(address);

      // Remove Loader
      WHFullScreenLoader.stopLoading();

      // Show Success Screen
      WHLoaders.successSnackBar(title: 'Congratulations', message: 'Your Address has been saved successfully.');

      // refresh address data
      refreshData.toggle();

      // Reset Fields
      resetFormFields();

      // Redirect
      Navigator.of(Get.context!).pop();

    } catch (e) {
      WHFullScreenLoader.stopLoading();
      WHLoaders.errorSnackBar(title: 'Error in Saving', message: e.toString());
    }
  }

  // Show Addresses BottomModelSheet at checkout
  Future<dynamic> selectNewAddressPopup(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (_) => Container(
        padding: const EdgeInsets.all(WatchHubSizes.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const WHSectionHeading(title: "Select Address", showActionButton: false),
            FutureBuilder(
              future: getAllUserAddresses(), 
              builder: (_, snapshot) {
                final response = WHCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot);
                if (response != null) return response;

                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (_,index) => WHSingleAddress(
                    address: snapshot.data![index],
                    onTap: () async {
                      await selectAddress(snapshot.data![index]);
                      Get.back();
                    }
                  )
                );
              }
            ),
            const SizedBox(height: WatchHubSizes.defaultSpace * 2),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: () => Get.to(() => const AddNewAddressScreen()), child: const Text("Add New Address")),
            )
          ],
        ),
      )
    );
  }

  // Reset Form Fields
  void resetFormFields() {
    name.clear();
    phoneNumber.clear();
    street.clear();
    city.clear();
    state.clear();
    postalCode.clear();
    country.clear();
    addressFormKey.currentState!.reset();
  }

}