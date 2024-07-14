import 'package:crafty_bay/model/category%20model/category_data_list.dart';
import 'package:crafty_bay/routes/routes_name.dart';
import 'package:crafty_bay/utils/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryItemSection extends StatelessWidget {
   CategoryItemSection({
    super.key,
     this.categoryData
  });

  CategoryDataList? categoryData;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
    onTap: () {
      Get.toNamed(RoutesName.productsByCategoryScreen,
      arguments: {
       'categoryTitle' : categoryData!.categoryName ??'No Title Found',
       'categoryId' : categoryData!.id.toString(),
      }
      );
    },
      child: Column(
        children: [
          Card(
            elevation: 0,
            color: AppColors.primaryColor.withOpacity(0.1),
            child:  Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.network(categoryData!.categoryImg!,
              height: 50,
              )
            ),
          ),
           Text(
            "${categoryData!.categoryName}",
            style: const TextStyle(
                fontSize: 15,
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}