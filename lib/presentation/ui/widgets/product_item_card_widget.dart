import 'package:crafty_bay/presentation/ui/screens/Product%20Screen/product_details_screen.dart';
import 'package:crafty_bay/utils/constants/asset_paths.dart';
import 'package:crafty_bay/utils/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductItemCard extends StatelessWidget {
  const ProductItemCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
    onTap: () {
      Get.to(ProductDetailsScreen());
    },
      child: ClipRRect(
      borderRadius: BorderRadius.circular(25),
        child: Card(
        
         elevation: 0,
         child: Column(
          children: [
           Container(
           alignment: Alignment.center,
           height: 90,
           width: 150,
              color: AppColors.primaryColor.withOpacity(0.2),
                    
            child: Image.asset(AssetPaths.dummyImage, width: 70,)
           ),
           Container(
           height: 50,
           width: 150,
            decoration: const BoxDecoration(
             color: Colors.white
            ),
           child: const Padding(
             padding: EdgeInsets.only(left: 10),
             child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
             Text("Nike Jordan 2024", maxLines: 1, overflow: TextOverflow.ellipsis,),
                 
             Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              
               Text("\$100"),
              
               Row(
                 children: [
                   Icon(Icons.star, color: Colors.yellow,),
                   Text("4.8"),
                 ],
               ),
               
               CircleAvatar(
                 
               radius: 10,
                backgroundColor: AppColors.primaryColor,
                child: Icon(Icons.favorite, size: 12, color: Colors.white,),
               ),
               
               Row(),
               Row(),
               
              ],
             )
             ],
             ),
           ),
           )
          ],
         ),
        ),
      ),
    );
  }
}