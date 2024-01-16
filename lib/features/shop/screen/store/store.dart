import "package:flutter/material.dart";
import "package:watchhub/common/widgets/appbar/appbar.dart";
import "package:watchhub/common/widgets/custom_shapes/containers/rounded_container.dart";
import "package:watchhub/common/widgets/custom_shapes/containers/search_container.dart";
import "package:watchhub/common/widgets/images/wh_circular_image.dart";
import "package:watchhub/common/widgets/layouts/grid_layout.dart";
import "package:watchhub/common/widgets/products/cart/cart_menu_icon.dart";
import "package:watchhub/common/widgets/texts/section_heading.dart";
import "package:watchhub/common/widgets/texts/wh_brand_title_text_with_verified_icon.dart";
import "package:watchhub/utils/constants/colors.dart";
import "package:watchhub/utils/constants/enums.dart";
import "package:watchhub/utils/constants/image_strings.dart";
import "package:watchhub/utils/constants/sizes.dart";
import "package:watchhub/utils/helpers/helper_functions.dart";

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = WatchHubHelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: WHAppBar(
        title: Text("Store", style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          WHCartCounterIcon(
            onPressed: () {}, 
            iconColor: dark ? WatchHubColors.white : WatchHubColors.black
          )
        ],
      ),
      body: NestedScrollView(
        headerSliverBuilder: (_, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              pinned: true,
              floating: true,
              backgroundColor: dark ? WatchHubColors.black : WatchHubColors.white,
              expandedHeight: 440,
              automaticallyImplyLeading: false,
              flexibleSpace: Padding(
                padding: const EdgeInsets.all(WatchHubSizes.defaultSpace),
                child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    /// ---- Search Bar
                    const SizedBox(height: WatchHubSizes.spaceBtwItems),
                    const WHSearchContainer(text: 'Search in Store', showBorder: true, showBackground: false, padding: EdgeInsets.zero),
                    const SizedBox(height: WatchHubSizes.spaceBtwSections),

                    /// ---- Featured Brands
                    WHSectionHeading(title: 'Featured Brands', onPressed: () {}),
                    const SizedBox(height: WatchHubSizes.spaceBtwItems / 1.5),

                    WHGridLayout(
                      itemCount: 6,
                      mainAxisExtent: 60, 
                      itemBuilder: (_, index) {
                        return GestureDetector(
                          onTap: () {},
                          child: WHRoundedContainer(
                            padding: const EdgeInsets.all(WatchHubSizes.sm),
                            showBorder: true,
                            backgroundColor: Colors.transparent,
                            child: Row(
                              children: [
                                /// -- Icon
                                Flexible(
                                  child: WHCircularImage(
                                    isNetworkImage: false,
                                    image: WatchHubImages.appleLogo,
                                    backgroundColor: Colors.transparent,
                                    overlayColor: dark ? WatchHubColors.white : WatchHubColors.black,
                                  ),
                                ),
                                const SizedBox(width: WatchHubSizes.spaceBtwItems / 2),
                      
                                /// -- Text
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const WHBrandTitleWithVerifiedIcon(title: 'Apple', brandTextSize: TextSizes.large),
                                      Text(
                                        '5 Products',
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context).textTheme.labelMedium,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }
                    )
                  ],
                ),
              ),
            )
          ];
        },
        body: Container()
      )
    );
  }
}
