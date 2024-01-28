import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watchhub/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:watchhub/common/widgets/shimmers/category_shimmer.dart';
import 'package:watchhub/features/shop/controllers/category_controller.dart';
import 'package:watchhub/features/shop/screen/sub_category/sub_categories.dart';

class WHHomeCategories extends StatelessWidget {
  const WHHomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());

    return Obx(() {
        if (categoryController.isLoading.value) return const WHCategoryShimmer();

        if(categoryController.featuredCategories.isEmpty){
          return Center(
            child: Text("No Data Found!", style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white)),
          );
        }
        return SizedBox(
          height: 80,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: categoryController.featuredCategories.length,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              final category = categoryController.featuredCategories[index];
              return WHVerticalImageText(
                image: category.image, 
                title: category.name,
                onTap: () => Get.to(() => const SubCategoriesScreen())
              );
            },
          ),
        );
      } 
    );
  }
}