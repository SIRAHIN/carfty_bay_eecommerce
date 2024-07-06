import 'package:crafty_bay/presentation/ui/screens/Bottom%20Nav%20Screen/Controller/bottom_nav_controller.dart';
import 'package:crafty_bay/presentation/ui/widgets/category_item_card_widget.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
    canPop: false,
     onPopInvokedWithResult: (didPop, result) => Get.find<BottomNavController>().backtoHomeScreen() ,
      child: Scaffold(
       appBar: AppBar(
        elevation: 1,
        backgroundColor:Colors.white54,
        title: Text("Categorys", style: Theme.of(context).textTheme.titleMedium,),
        leading: IconButton(onPressed: () {
          Get.find<BottomNavController>().backtoHomeScreen();
        }, icon: const Icon(Icons.arrow_back_ios_rounded)),
       ),
       body: GridView.builder(
       padding:const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
       crossAxisCount: 4,
       crossAxisSpacing: 5.5,
       mainAxisSpacing: 25.5
       
       ), 
       itemBuilder: (context, index) {
         return const FittedBox(child: CategoryItemSection());
       },
       ),
      ),
    );
  }
}