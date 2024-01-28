import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watchhub/common/widgets/chips/choice_chip.dart';
import 'package:watchhub/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:watchhub/common/widgets/texts/product_price_text.dart';
import 'package:watchhub/common/widgets/texts/product_title_text.dart';
import 'package:watchhub/common/widgets/texts/section_heading.dart';
import 'package:watchhub/features/shop/controllers/product/variation_controller.dart';
import 'package:watchhub/features/shop/models/product_model.dart';
import 'package:watchhub/utils/constants/colors.dart';
import 'package:watchhub/utils/constants/sizes.dart';
import 'package:watchhub/utils/helpers/helper_functions.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VariationController());
    final dark = WatchHubHelperFunctions.isDarkMode(context);
    
    return Obx(
      () => Column(
        children: [
          /// -- Selected Attribute Pricing & Description
          /// Display variation price and stock when some variation is selected
          if(controller.selectedVariation.value.id.isNotEmpty)
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
                            if (controller.selectedVariation.value.salePrice > 0)
                            Text("\$${controller.selectedVariation.value.price}", style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough)),
                            const SizedBox(width: WatchHubSizes.spaceBtwItems),
      
                            /// Sale Price
                            WHProductPriceText(price: controller.getVariationPrice()),
                          ],
                        ),
      
                        /// Stock
                        Row(
                          children: [
                            const WHProductTitleText(title: "Stock : ", smallSize: true),
                            Text(controller.variationStockStatus.value, style: Theme.of(context).textTheme.titleMedium)
                          ]
                        )
                      ],
                    ),
                    
                  ],
                ),
      
      
                /// Variation Description
                WHProductTitleText(
                  title: controller.selectedVariation.value.description ?? "",
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
            children: product.productAttributes!.map(
              (attribute) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WHSectionHeading(title: attribute.name ?? "", showActionButton: false,),
                  const SizedBox(height: WatchHubSizes.spaceBtwItems / 2),
                  Obx(
                    () => Wrap(
                      spacing: 8,
                      children: attribute.values!.map((attributeValue) {
                    
                        final isSelected = controller.selectedAttributes[attribute.name] == attributeValue;
                        final available = controller.getAttributesAvailabilityInVariation(product.productVariations!, attribute.name!).contains(attributeValue);
                    
                        return WHChoiceChip(
                          text: attributeValue, 
                          selected: isSelected, 
                          onSelected: available 
                            ? (selected) {
                                if(selected && available){
                                  controller.onAttributeSelected(product, attribute.name ?? '', attributeValue);
                                }
                              } 
                            : null
                        );
                      }).toList(), 
                    ),
                  )
                ],
              ),
            ).toList(),
          ),
      
        ],
      ),
    );
  }
}




