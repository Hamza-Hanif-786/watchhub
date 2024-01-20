import 'package:flutter/material.dart';
import 'package:watchhub/common/widgets/chips/choice_chip.dart';
import 'package:watchhub/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:watchhub/common/widgets/texts/product_price_text.dart';
import 'package:watchhub/common/widgets/texts/product_title_text.dart';
import 'package:watchhub/common/widgets/texts/section_heading.dart';
import 'package:watchhub/utils/constants/colors.dart';
import 'package:watchhub/utils/constants/sizes.dart';
import 'package:watchhub/utils/helpers/helper_functions.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = WatchHubHelperFunctions.isDarkMode(context);
    
    return Column(
      children: [
        /// -- Selected Attribute Pricing & Description
        WHRoundedContainer(
          padding: const EdgeInsets.all(WatchHubSizes.md),
          backgroundColor: dark ? WatchHubColors.darkerGrey : WatchHubColors.grey,
          child: Column(
            children: [

              /// Title, Price and Stock Status
              Row(
                children: [
                  const WHSectionHeading(title: "Variation", showActionButton: false),
                  const SizedBox(width: WatchHubSizes.spaceBtwItems),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const WHProductTitleText(title: "Price : ", smallSize: true),

                          /// Actual Price
                          Text("\$35", style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough)),
                          const SizedBox(width: WatchHubSizes.spaceBtwItems),

                          /// Sale Price
                          const WHProductPriceText(price: "30"),
                        ],
                      ),

                      /// Stock
                      Row(
                        children: [
                          const WHProductTitleText(title: "Stock : ", smallSize: true),
                          Text("In Stock", style: Theme.of(context).textTheme.titleMedium)
                        ]
                      )
                    ],
                  ),
                  
                ],
              ),


              /// Variation Description
              const WHProductTitleText(
                title: "This is the Description of the Product and it can upto max 4 lines.",
                smallSize: true,
                maxLines: 4,
              )
            ]
          ),
        ),
        const SizedBox(height: WatchHubSizes.spaceBtwItems),

        /// -- Attributes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const WHSectionHeading(title: "Colors", showActionButton: false,),
            const SizedBox(height: WatchHubSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                WHChoiceChip(text: 'Blue', selected: false, onSelected: (value) {}),
                WHChoiceChip(text: 'Green', selected: false, onSelected: (value) {}),
                WHChoiceChip(text: 'Orange', selected: true, onSelected: (value) {}),
              ],
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const WHSectionHeading(title: "Size", showActionButton: false,),
            const SizedBox(height: WatchHubSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                WHChoiceChip(text: 'EU 34', selected: false, onSelected: (value) {}),
                WHChoiceChip(text: 'EU 36', selected: true, onSelected: (value) {}),
                WHChoiceChip(text: 'EU 38', selected: false, onSelected: (value) {}),
              ],
            )
          ],
        ),

      ],
    );
  }
}




