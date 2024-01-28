import 'package:flutter/material.dart';
import 'package:watchhub/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:watchhub/common/widgets/images/wh_circular_image.dart';
import 'package:watchhub/common/widgets/texts/product_price_text.dart';
import 'package:watchhub/common/widgets/texts/product_title_text.dart';
import 'package:watchhub/common/widgets/texts/wh_brand_title_text_with_verified_icon.dart';
import 'package:watchhub/features/shop/controllers/product/product_controller.dart';
import 'package:watchhub/features/shop/models/product_model.dart';
import 'package:watchhub/utils/constants/colors.dart';
import 'package:watchhub/utils/constants/enums.dart';
import 'package:watchhub/utils/constants/sizes.dart';
import 'package:watchhub/utils/helpers/helper_functions.dart';

class WHProductMetaData extends StatelessWidget {
  const WHProductMetaData({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage = controller.calculateSalePercentage(product.price, product.salePrice);
    final dark = WatchHubHelperFunctions.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// -- Price & Sale Price
        Row(
          children: [
            /// Sale Tag
            WHRoundedContainer(
              radius: WatchHubSizes.sm,
              backgroundColor: WatchHubColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(horizontal: WatchHubSizes.sm, vertical: WatchHubSizes.xs),
              child: Text("$salePercentage%", style: Theme.of(context).textTheme.labelLarge!.apply(color: WatchHubColors.black)),
            ),
            const SizedBox(width: WatchHubSizes.spaceBtwItems),       
            
            /// Price
            if(product.productType == ProductType.single.toString() && product.salePrice > 0)
              Text("\$${product.price}", style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough)),
            if(product.productType == ProductType.single.toString() && product.salePrice > 0)
              const SizedBox(width: WatchHubSizes.spaceBtwItems),       
              WHProductPriceText(price: controller.getProductPrice(product), isLarge: true,),
          ]
        ),
        const SizedBox(height: WatchHubSizes.spaceBtwItems / 1.5),       
        
        /// -- Title
        WHProductTitleText(title: product.title),
        const SizedBox(height: WatchHubSizes.spaceBtwItems / 1.5),       
         
        /// -- Stock Status
        Row(
          children: [
            const WHProductTitleText(title: "Status:"),
            const SizedBox(width: WatchHubSizes.spaceBtwItems),       
            Text(controller.getProductStockStatus(product.stock), style: Theme.of(context).textTheme.titleMedium),     
          ],
        ),
        const SizedBox(height: WatchHubSizes.spaceBtwItems / 1.5), 
         
        /// -- Brand
        Row(
          children: [
            WHCircularImage(
              image: product.brand != null ? product.brand!.image : "",
              width: 50,
              height: 50,
              overlayColor: dark ? WatchHubColors.white : WatchHubColors.black,
            ),
            WHBrandTitleWithVerifiedIcon(title: product.brand != null ? product.brand!.name : "", brandTextSize: TextSizes.medium),
          ],
        ),
      ],
    );
  }
}