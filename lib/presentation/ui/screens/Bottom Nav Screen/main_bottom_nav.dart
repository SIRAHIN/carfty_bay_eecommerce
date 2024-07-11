import 'package:crafty_bay/presentation/ui/screens/Bottom%20Nav%20Screen/Controller/banner_slider_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/Bottom%20Nav%20Screen/Controller/bottom_nav_controller.dart';
import 'package:crafty_bay/utils/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainBottomNav extends StatefulWidget {
  const MainBottomNav({super.key});

  @override
  State<MainBottomNav> createState() => _MainBottomNavState();


  
}
 
 

class _MainBottomNavState extends State<MainBottomNav> {

 // BottomNavController get screenController => Get.find();
  @override
  Widget build(BuildContext context) {
  // print(AppStoredData.profileData!.firstName);
    return GetBuilder<BottomNavController>(
    builder: (controller) => 
        Scaffold(
        body: controller.fragmentsScreen[controller.currentIndex],
        bottomNavigationBar: BottomNavigationBar(
        currentIndex: controller.currentIndex,
        onTap: (value) {
          controller.onTapChangeIndex(value);
        },
        showSelectedLabels: true,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        backgroundColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.category_rounded), label: 'Category'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_rounded), label: 'Wish'),
        ]),
      ),
    );
  }
}
