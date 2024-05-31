import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watchhub/common/widgets/list_tiles/payment_tile.dart';
import 'package:watchhub/common/widgets/texts/section_heading.dart';
import 'package:watchhub/features/shop/models/payment_method_model.dart';
import 'package:watchhub/utils/constants/image_strings.dart';
import 'package:watchhub/utils/constants/sizes.dart';

class CheckoutController extends GetxController {
  static CheckoutController get instance => Get.find();

  final Rx<PaymentMethodModel> selectedPaymentMethod = PaymentMethodModel.empty().obs;

  @override
  void onInit() {
    selectedPaymentMethod.value = PaymentMethodModel(name: 'Paypal', image: WatchHubImages.paypal);
    super.onInit();
  }

  Future<dynamic> selectPaymentMethod(BuildContext context) {

    return showModalBottomSheet(
      context: context, 
      builder: (_) => SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(WatchHubSizes.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const WHSectionHeading(title: 'Select Payment Method', showActionButton: false),
              const SizedBox(height: WatchHubSizes.spaceBtwSections),
              WHPaymentTile(paymentMethod: PaymentMethodModel(name: 'Paypal', image: WatchHubImages.paypal)),
              const SizedBox(height: WatchHubSizes.spaceBtwItems / 2),
              WHPaymentTile(paymentMethod: PaymentMethodModel(name: 'Google Pay', image: WatchHubImages.googlePay)),
              const SizedBox(height: WatchHubSizes.spaceBtwItems / 2),
              WHPaymentTile(paymentMethod: PaymentMethodModel(name: 'Apple Pay', image: WatchHubImages.applePay)),
              const SizedBox(height: WatchHubSizes.spaceBtwItems / 2),
              WHPaymentTile(paymentMethod: PaymentMethodModel(name: 'VISA', image: WatchHubImages.visa)),
              const SizedBox(height: WatchHubSizes.spaceBtwItems / 2),
              WHPaymentTile(paymentMethod: PaymentMethodModel(name: 'Master Card', image: WatchHubImages.mastercard)),
              const SizedBox(height: WatchHubSizes.spaceBtwItems / 2),
              WHPaymentTile(paymentMethod: PaymentMethodModel(name: 'Paytm', image: WatchHubImages.paytm)),
              const SizedBox(height: WatchHubSizes.spaceBtwItems / 2),
              WHPaymentTile(paymentMethod: PaymentMethodModel(name: 'Paystack', image: WatchHubImages.paystack)),
              const SizedBox(height: WatchHubSizes.spaceBtwItems / 2),
              WHPaymentTile(paymentMethod: PaymentMethodModel(name: 'Credit Card', image: WatchHubImages.creditcard)),
              const SizedBox(height: WatchHubSizes.spaceBtwItems / 2),
              const SizedBox(height: WatchHubSizes.spaceBtwSections),
            ],
          ),
        ),
      )
    );
  }

}