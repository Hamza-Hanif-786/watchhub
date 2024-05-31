import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:iconsax/iconsax.dart";
import "package:watchhub/common/widgets/custom_shapes/containers/rounded_container.dart";
import "package:watchhub/features/shop/controllers/product/checkout_controller.dart";
import "package:watchhub/features/shop/models/payment_method_model.dart";
import "package:watchhub/utils/constants/colors.dart";
import "package:watchhub/utils/constants/sizes.dart";
import "package:watchhub/utils/helpers/helper_functions.dart";

class WHPaymentTile extends StatelessWidget {
  const WHPaymentTile({super.key, required this.paymentMethod});

  final PaymentMethodModel paymentMethod;

  @override
  Widget build(BuildContext context) {
    final controller = CheckoutController.instance;
    final dark = WatchHubHelperFunctions.isDarkMode(context);
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      onTap: () {
        controller.selectedPaymentMethod.value = paymentMethod;
        Get.back();
      },
      leading: WHRoundedContainer(
        width: 60,
        height: 40,
        backgroundColor: dark ? WatchHubColors.light : WatchHubColors.white,
        padding: const EdgeInsets.all(WatchHubSizes.sm),
        child: Image(image: AssetImage(paymentMethod.image), fit: BoxFit.contain),
      ),
      title: Text(paymentMethod.name),
      trailing: const Icon(Iconsax.arrow_right_34),
    );
  }
}