import 'package:crafty_bay/presentation/ui/screens/Bottom%20Nav%20Screen/Controller/Fragments%20Controller/Home%20Fragment%20Controller/banner_slider_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/Bottom%20Nav%20Screen/Controller/Fragments%20Controller/Category%20Fragment%20Controller/category_item_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/Bottom%20Nav%20Screen/Controller/Fragments%20Controller/Home%20Fragment%20Controller/new_product_lsit_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/Bottom%20Nav%20Screen/Controller/Fragments%20Controller/Home%20Fragment%20Controller/popular_product_lsit_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/Bottom%20Nav%20Screen/Controller/Fragments%20Controller/Home%20Fragment%20Controller/special_product_lsit_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/Bottom%20Nav%20Screen/Fragments/cart_list_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/Bottom%20Nav%20Screen/Fragments/category_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/Bottom%20Nav%20Screen/Fragments/home_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/Bottom%20Nav%20Screen/Fragments/wish_list_screen.dart';
import 'package:crafty_bay/utils/utility/Shared%20Preferences/app_stored_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavController extends GetxController {
  var _selectedIndex = 0;


  @override
  void onInit() {
   // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
     Get.find<BannerSliderController>().getSliderData();
     Get.find<CategoryItemController>().getCategoryListData();
     Get.find<PopularProductLsitController>().getProductByRemark();
     Get.find<SpecialProductLsitController>().getProductByRemark();
     Get.find<NewProductLsitController>().getProductByRemark();
     AppStoredData().initalCheckUserStoredData();
//   });

    super.onInit();
  }

  int get currentIndex => _selectedIndex;

  void onTapChangeIndex (indexValue){
    _selectedIndex = indexValue;
    update();
  }

  void backtoHomeScreen (){
   onTapChangeIndex(0);
  }

   List<Widget> fragmentsScreen = [
   const HomeScreen(),
   const CategoryScreen(),
   const CartListScreen(),
   const WishListScreen()
  ];
}