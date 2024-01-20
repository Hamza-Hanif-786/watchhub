import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watchhub/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:watchhub/features/shop/screen/sub_category/sub_categories.dart';
import 'package:watchhub/utils/constants/image_strings.dart';

class WHHomeCategories extends StatelessWidget {
  const WHHomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 7,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return WHVerticalImageText(
            image: WatchHubImages.dressIcon, 
            title: 'Dress Watches',
            onTap: () => Get.to(() => const SubCategoriesScreen())
          );
        },
      ),
    );
  }
}