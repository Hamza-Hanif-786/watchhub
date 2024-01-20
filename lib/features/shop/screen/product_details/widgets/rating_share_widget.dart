import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:watchhub/utils/constants/sizes.dart';

class WHRatingAndShare extends StatelessWidget {
  const WHRatingAndShare({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        /// Rating
        Row(
          children: [
            const Icon(Iconsax.star5, color: Colors.amber, size: 24),
            const SizedBox(width: WatchHubSizes.spaceBtwItems / 2),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: '5.0 ', style: Theme.of(context).textTheme.bodyLarge),
                  const TextSpan(text: '(150)'),
                ]
              )
            )
          ],
        ),
    
        /// Share Button
        IconButton(onPressed: () {}, icon: const Icon(Icons.share, size: WatchHubSizes.iconMd))
      ],
    );
  }
}

