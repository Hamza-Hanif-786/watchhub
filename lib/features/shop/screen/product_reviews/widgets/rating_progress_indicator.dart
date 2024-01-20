import 'package:flutter/material.dart';
import 'package:watchhub/features/shop/screen/product_reviews/widgets/progress_indicator_and_rating.dart';

class WHOverallProductRating extends StatelessWidget {
  const WHOverallProductRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 3, child: Text("4.8", style: Theme.of(context).textTheme.displayLarge)),
        const Expanded(
          flex: 7,
          child: Column(
            children: [
              WHRatingProgressIndicator(text: '5', value: 1.0),
              WHRatingProgressIndicator(text: '4', value: 0.8),
              WHRatingProgressIndicator(text: '3', value: 0.6),
              WHRatingProgressIndicator(text: '2', value: 0.4),
              WHRatingProgressIndicator(text: '1', value: 0.2),
            ],
          ),
        )
      ],
    );
  }
}