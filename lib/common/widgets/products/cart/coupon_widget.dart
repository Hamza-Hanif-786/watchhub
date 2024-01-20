import 'package:flutter/material.dart';
import 'package:watchhub/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:watchhub/utils/constants/colors.dart';
import 'package:watchhub/utils/constants/sizes.dart';
import 'package:watchhub/utils/helpers/helper_functions.dart';

class WHCouponCode extends StatelessWidget {
  const WHCouponCode({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    final dark = WatchHubHelperFunctions.isDarkMode(context);
    
    return WHRoundedContainer(
      showBorder: true,
      backgroundColor: dark ? WatchHubColors.dark : WatchHubColors.white,
      padding: const EdgeInsets.only(
        top: WatchHubSizes.sm,
        bottom: WatchHubSizes.sm,
        right: WatchHubSizes.sm,
        left: WatchHubSizes.md
      ),
      child: Row(
        children: [
          /// TextField
          Flexible(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: "Have a promo code? Enter here",
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none
              ),
            )
          ),
    
          /// Button
          SizedBox(
            width: 80,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                foregroundColor: dark ? WatchHubColors.white.withOpacity(0.5) : WatchHubColors.dark.withOpacity(0.5),
                backgroundColor: Colors.grey.withOpacity(0.2),
                side: BorderSide(color: Colors.grey.withOpacity(0.1)),
              ), 
              child: const Text("Apply")
            )
          )
        ],
      ),
    );
  }
}