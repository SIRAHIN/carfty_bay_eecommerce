import 'package:crafty_bay/model/Product%20Card%20View%20Model/porductCardListData.dart';
import 'package:crafty_bay/presentation/ui/screens/Bottom%20Nav%20Screen/Controller/Fragments%20Controller/WishList%20Freagments%20Controller/wish_list_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/Product%20Screen/product_details_screen.dart';
import 'package:crafty_bay/utils/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductItemCard extends StatelessWidget {
  ProductItemCard({super.key, this.productCardListData});

  // Getting one item from Product Card List //
  ProductCardListData? productCardListData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onDoubleTap: () {
        Get.find<WishListController>().removedWishListByID(productCardListData!.id.toString());
      },
      onTap: () {
        Get.to(ProductDetailsScreen(
          productId: productCardListData!.id.toString(),
        ));
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Card(
          elevation: 0,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                    color: AppColors.primaryColor.withOpacity(0.2),
                    image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: NetworkImage(productCardListData?.image ??
                            'https://static-00.iconduck.com/assets.00/no-image-icon-512x512-lfoanl0w.png'))),
                alignment: Alignment.center,
                height: 90,
                width: 150,
      
                // child: Image.network(productCardListData?.image ?? 'https://static-00.iconduck.com/assets.00/no-image-icon-512x512-lfoanl0w.png', width: 90,),
              ),
              const SizedBox(
                height: 2,
              ),
              Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(color: Colors.white.withOpacity(0.5)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${productCardListData?.title}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("\$${productCardListData?.price}"),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                              Text(productCardListData?.star.toString() ??
                                  '0.0'),
                            ],
                          ),
                          CircleAvatar(
                            radius: 10,
                            backgroundColor: AppColors.primaryColor,
                            child: GetBuilder<WishListController>(
                              builder: (wishController) => InkWell(
                                onTap: () => wishController.addWishListByID(
                                    productCardListData!.id.toString()),
                                child: const Icon(
                                  Icons.favorite,
                                  size: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const Row(),
                          const Row(),
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
