import 'package:crafty_bay/model/Product%20Card%20View%20Model/porductCardListData.dart';
import 'package:crafty_bay/presentation/ui/screens/Bottom%20Nav%20Screen/Controller/Bottom%20Nav%20Controller/bottom_nav_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/Bottom%20Nav%20Screen/Controller/Fragments%20Controller/WishList%20Freagments%20Controller/wish_list_controller.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_item_card_widget.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Get.find<WishListController>().getWishListData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) =>
          Get.find<BottomNavController>().backtoHomeScreen(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          backgroundColor: Colors.white54,
          title: Text(
            "Wish List",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          leading: IconButton(
              onPressed: () {
                Get.find<BottomNavController>().backtoHomeScreen();
              },
              icon: const Icon(Icons.arrow_back_ios_rounded)),
        ),
        body: GetBuilder<WishListController>(
          builder: (wishController) => Visibility(
            replacement: const Center(child: CircularProgressIndicator()),
            visible: wishController.isLoading == false,
            child: wishController.wishListModel.wishDataList!.isEmpty
                ? const Center(
                    child: Text(
                    "You Have No Wish List Yet",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ))
                : GridView.builder(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 6.5,
                            mainAxisSpacing: 10.5),
                    itemCount:
                        wishController.wishListModel.wishDataList?.length ?? 0,
                    itemBuilder: (context, index) {
                      ProductCardListData wishListItem = wishController
                          .wishListModel.wishDataList![index].product!;
                      return FittedBox(
                          child: ProductItemCard(
                        productCardListData: wishListItem,
                      ));
                    },
                  ),
          ),
        ),
      ),
    );
  }
}
