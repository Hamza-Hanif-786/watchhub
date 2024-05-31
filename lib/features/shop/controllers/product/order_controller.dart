import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:watchhub/common/widgets/success_screen/success_screen.dart";
import "package:watchhub/data/repositories/authentication/authentication_repository.dart";
import "package:watchhub/data/repositories/orders/order_repository.dart";
import "package:watchhub/features/personalization/controllers/address_controller.dart";
import "package:watchhub/features/shop/controllers/product/cart_controller.dart";
import "package:watchhub/features/shop/controllers/product/checkout_controller.dart";
import "package:watchhub/features/shop/models/order_model.dart";
import "package:watchhub/navigation_menu.dart";
import "package:watchhub/utils/constants/enums.dart";
import "package:watchhub/utils/constants/image_strings.dart";
import "package:watchhub/utils/popups/full_screen_loader.dart";
import "package:watchhub/utils/popups/loaders.dart";

class OrderController extends GetxController {
  static OrderController get instance => Get.find();

  // Variables
  final cartController = CartController.instance;
  final addressController = AddressController.instance;
  final checkoutController = CheckoutController.instance;
  final orderRepository = Get.put(OrderRepository());


  // Fetch Users Orders History
  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      final userOrders = await orderRepository.fetchUserOrders();
      return userOrders;
    } catch (e) {
      WHLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }


  // Add Methods for order processing
  void processOrder(double totalAmount) async {
    try {
      // Start loader
      WHFullScreenLoader.openLoadingDialog('Processing Your Order', WatchHubImages.pencilAnimation);

      // Get User Authentication Id
      final userId = AuthenticationRepository.instance.authUser!.uid;
      if (userId.isEmpty) return;

      // Add Details
      final order = OrderModel(
        id: UniqueKey().toString(),
        userId: userId,
        status: OrderStatus.pending,
        totalAmount: totalAmount,
        orderDate: DateTime.now(),
        paymentMethod: checkoutController.selectedPaymentMethod.value.name,
        address: addressController.selectedAddress.value,
        deliveryDate: DateTime.now(),
        items: cartController.cartItems.toList()
      );

      // save order to firestore
      await orderRepository.saveOrder(order, userId);

      // update the cart staus
      cartController.clearCart();

      // Show Success Screen
      Get.off(() => SuccessScreen(
        title: 'Payment Success!', 
        subtitle: 'Your item has been shipped soon', 
        image: WatchHubImages.orderCompletedAnimation,
        onPressed: () => Get.offAll(() => const NavigationMenu()),
      ));
    } catch (e) {
      WHLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

}