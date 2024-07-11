import 'package:crafty_bay/presentation/ui/screens/Bottom%20Nav%20Screen/Controller/banner_slider_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/Bottom%20Nav%20Screen/Controller/bottom_nav_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/Bottom%20Nav%20Screen/Fragments/Widgets/Home%20Widgets/Banner_Slider.dart';
import 'package:crafty_bay/presentation/ui/screens/Bottom%20Nav%20Screen/Fragments/Widgets/Home%20Widgets/home_Appbar.dart';
import 'package:crafty_bay/presentation/ui/screens/Bottom%20Nav%20Screen/Fragments/Widgets/Home%20Widgets/searchText_field.dart';
import 'package:crafty_bay/presentation/ui/screens/Bottom%20Nav%20Screen/Fragments/Widgets/Home%20Widgets/sectionLevel_text.dart';
import 'package:crafty_bay/presentation/ui/screens/Product%20Screen/widgets/product_bannerSlider.dart';
import 'package:crafty_bay/presentation/ui/widgets/category_item_card_widget.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_item_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              const SearchTextField(),
              const SizedBox(
                height: 15,
              ),
           
              
                GetBuilder<BannerSliderController>(
                  builder: (controller) {
                    return Visibility(
                      visible: controller.isLoading == false,
                      replacement: const Center(child: CircularProgressIndicator()),
                      child: BannerSlider(
                      bannerList: controller.sliderModel.sliderDataList ?? [],
                      ),
                    );
                  }
                ),
      
            
              
              const SizedBox(
                height: 15,
              ),
            

              /// Categories Card View ///
               
              SectionLevelText(
                titleText: 'All categories',
                btnTitleText: 'See All',
                onTap: () => Get.find<BottomNavController>().onTapChangeIndex(1),
              ),
              SizedBox(
                height: 100,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  primary: false,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return const CategoryItemSection();
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      width: 20,
                    );
                  },
                ),
              ),

              /// Popolur Card View ///
              const SizedBox(
                height: 12,
              ),
              const SectionLevelText(
                titleText: 'Popular',
                btnTitleText: 'See All',
              ),

              SizedBox(
                height: 150,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  primary: false,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return const ProductItemCard();
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      width: 10,
                    );
                  },
                ),
              ),

              /// Special Card View ///
              const SizedBox(
                height: 12,
              ),
              const SectionLevelText(
                titleText: 'Special',
                btnTitleText: 'See All',
              ),

              SizedBox(
                height: 150,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  primary: false,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return const ProductItemCard();
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      width: 10,
                    );
                  },
                ),
              ),

              /// New Card View ///
              const SizedBox(
                height: 12,
              ),
              const SectionLevelText(
                titleText: 'New',
                btnTitleText: 'See All',
              ),

              SizedBox(
                height: 150,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  primary: false,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return const ProductItemCard();
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      width: 10,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


