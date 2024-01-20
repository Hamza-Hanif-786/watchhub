import "package:flutter/material.dart";
import "package:watchhub/common/widgets/custom_shapes/containers/rounded_container.dart";
import "package:watchhub/common/widgets/products/ratings/rating_indicator.dart";
import "package:watchhub/utils/constants/colors.dart";
import "package:watchhub/utils/constants/image_strings.dart";
import "package:watchhub/utils/constants/sizes.dart";
import "package:watchhub/utils/helpers/helper_functions.dart";
import "package:readmore/readmore.dart";

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = WatchHubHelperFunctions.isDarkMode(context);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(backgroundImage: AssetImage(WatchHubImages.user)),
                const SizedBox(width: WatchHubSizes.spaceBtwItems),
                Text("John Doe", style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          ],
        ),
        const SizedBox(height: WatchHubSizes.spaceBtwItems),

        /// Review
        Row(
          children: [
            const WHRatingBarIndicator(rating: 4.5),
            const SizedBox(width: WatchHubSizes.spaceBtwItems),
            Text("01 Jan, 2024", style: Theme.of(context).textTheme.bodyMedium,)
          ],
        ),
        const SizedBox(height: WatchHubSizes.spaceBtwItems),
        const ReadMoreText(
          "The user interface of a app is quite intuitive. I was able to navigate and make purchase seamlessly. Great job!",
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimExpandedText: " show less",
          trimCollapsedText: " show more",
          moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: WatchHubColors.primary),
          lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: WatchHubColors.primary),
        ),
        const SizedBox(height: WatchHubSizes.spaceBtwItems),

        /// Company Review
        WHRoundedContainer(
          backgroundColor: dark ? WatchHubColors.darkerGrey : WatchHubColors.grey,
          child: Padding(
            padding: const EdgeInsets.all(WatchHubSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("WatchHub", style: Theme.of(context).textTheme.titleMedium),
                    Text("02 Jan, 2024", style: Theme.of(context).textTheme.bodyMedium),
                  ]
                ),
                const SizedBox(height: WatchHubSizes.spaceBtwItems),
                const ReadMoreText(
                  "The user interface of a app is quite intuitive. I was able to navigate and make purchase seamlessly. Great job!",
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimExpandedText: " show less",
                  trimCollapsedText: " show more",
                  moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: WatchHubColors.primary),
                  lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: WatchHubColors.primary),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: WatchHubSizes.spaceBtwSections),
      ],
    );
  }
}