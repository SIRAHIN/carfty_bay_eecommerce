import 'package:crafty_bay/model/sliderDataList.dart';
import 'package:crafty_bay/presentation/ui/screens/Bottom%20Nav%20Screen/Controller/banner_slider_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/Bottom%20Nav%20Screen/Fragments/cart_list_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/Bottom%20Nav%20Screen/Fragments/category_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/Bottom%20Nav%20Screen/Fragments/home_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/Bottom%20Nav%20Screen/Fragments/wish_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavController extends GetxController {
  var _selectedIndex = 0;


  @override
  void onInit()  {
    super.onInit();
     Get.find<BannerSliderController>().getSliderData();
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