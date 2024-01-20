import "package:flutter/material.dart";
import "package:watchhub/common/widgets/appbar/appbar.dart";
import "package:watchhub/features/shop/screen/order/widgets/orders_list.dart";
import "package:watchhub/utils/constants/sizes.dart";

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// -- Appbar
      appBar: WHAppBar(title: Text("My Orders", style: Theme.of(context).textTheme.headlineSmall), showBackArrow: true,),
      body: const Padding(
        padding: EdgeInsets.all(WatchHubSizes.defaultSpace),

        /// -- Orders
        child: WHOrderListItems(),
      ),
    );
  }
}