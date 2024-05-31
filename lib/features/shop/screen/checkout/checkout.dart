import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watchhub/common/widgets/appbar/appbar.dart';
import 'package:watchhub/common/widgets/custom_shapes/containers/rounded_container.dart';
//import 'package:watchhub/common/widgets/products/cart/coupon_widget.dart';
import 'package:watchhub/features/shop/controllers/product/cart_controller.dart';
import 'package:watchhub/features/shop/controllers/product/order_controller.dart';
import 'package:watchhub/features/shop/screen/cart/widgets/cart_items.dart';
import 'package:watchhub/features/shop/screen/checkout/widgets/billing_address_section.dart';
import 'package:watchhub/features/shop/screen/checkout/widgets/billing_amount_section.dart';
import 'package:watchhub/features/shop/screen/checkout/widgets/billing_payment_section.dart';
import 'package:watchhub/utils/constants/colors.dart';
import 'package:watchhub/utils/constants/sizes.dart';
import 'package:watchhub/utils/helpers/helper_functions.dart';
import 'package:watchhub/utils/helpers/pricing_calculator.dart';
import 'package:watchhub/utils/popups/loaders.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    final subTotal = cartController.totalCartPrice.value;
    final orderController = Get.put(OrderController());
    final totalAmount = WatchHubPricingCalculator.calculateTotalPrice(subTotal, "US");
    final dark = WatchHubHelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar:  WHAppBar(showBackArrow: true, title: Text("Order Review", style: Theme.of(context).textTheme.headlineSmall)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(WatchHubSizes.defaultSpace),
          child: Column(
            children: [
              /// -- Items in Cart 
              const WHCartItems(showAddRemoveButtons: false),
              const SizedBox(height: WatchHubSizes.spaceBtwSections),

              /// -- Coupon TextField
              // const WHCouponCode(),
              // const SizedBox(height: WatchHubSizes.spaceBtwSections),

              /// -- Biling Section
              WHRoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(WatchHubSizes.md),
                backgroundColor: dark ? WatchHubColors.black : WatchHubColors.white,
                child: const Column(
                  children: [
                    /// Pricing
                    WHBillingAmountSection(),
                    SizedBox(height: WatchHubSizes.spaceBtwItems),

                    /// Divider
                    Divider(),
                    SizedBox(height: WatchHubSizes.spaceBtwItems),

                    /// Payment Methods
                    WHBillingPaymentSection(),
                    SizedBox(height: WatchHubSizes.spaceBtwItems),

                    /// Address
                    WHBillingAddressSection(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(WatchHubSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: subTotal > 0 
              ? () => orderController.processOrder(totalAmount) 
              : () => WHLoaders.warningSnackBar(title: 'Empty Cart', message: 'Add items in the cart to proceed'), 
          child: Text("Checkout \$$totalAmount")
        ),
      )
    );
  }
}

