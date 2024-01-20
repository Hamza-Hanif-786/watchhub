import "package:flutter/material.dart";
import "package:watchhub/common/widgets/appbar/appbar.dart";
import "package:watchhub/common/widgets/products/ratings/rating_indicator.dart";
import "package:watchhub/features/shop/screen/product_reviews/widgets/rating_progress_indicator.dart";
import "package:watchhub/features/shop/screen/product_reviews/widgets/user_review_card.dart";
import "package:watchhub/utils/constants/sizes.dart";

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// -- App Bar
      appBar: const WHAppBar(title: Text("Reviews & Ratings"), showBackArrow: true,),

      /// -- Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(WatchHubSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Ratings and reviews are verified and from people who use the same type of device that you use."),
              const SizedBox(height: WatchHubSizes.spaceBtwItems),

              /// Overall Product Ratings
              const WHOverallProductRating(),
              const WHRatingBarIndicator(rating: 3.5),
              Text("12,611", style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: WatchHubSizes.spaceBtwSections),

              /// User Reviews List
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard()
            ],
          ),
        ),
      ),
    );
  }
}


