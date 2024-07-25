import 'package:crafty_bay/model/category%20model/category_data_list.dart';
import 'package:crafty_bay/presentation/ui/screens/Bottom%20Nav%20Screen/Controller/Fragments%20Controller/Home%20Fragment%20Controller/banner_slider_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/Bottom%20Nav%20Screen/Controller/Fragments%20Controller/Home%20Fragment%20Controller/new_product_lsit_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/Bottom%20Nav%20Screen/Controller/Fragments%20Controller/Home%20Fragment%20Controller/special_product_lsit_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/Bottom%20Nav%20Screen/Controller/Bottom%20Nav%20Controller/bottom_nav_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/Bottom%20Nav%20Screen/Controller/Fragments%20Controller/Category%20Fragment%20Controller/category_item_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/Bottom%20Nav%20Screen/Controller/Fragments%20Controller/Home%20Fragment%20Controller/popular_product_lsit_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/Bottom%20Nav%20Screen/Fragments/Widgets/Home%20Widgets/Banner_Slider.dart';
import 'package:crafty_bay/presentation/ui/screens/Bottom%20Nav%20Screen/Fragments/Widgets/Home%20Widgets/home_Appbar.dart';
import 'package:crafty_bay/presentation/ui/screens/Bottom%20Nav%20Screen/Fragments/Widgets/Home%20Widgets/searchText_field.dart';
import 'package:crafty_bay/presentation/ui/screens/Bottom%20Nav%20Screen/Fragments/Widgets/Home%20Widgets/sectionLevel_text.dart';
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
           
              // *Banner Slider* // 
                GetBuilder<BannerSliderController>(
                  builder: (controller) {
                    return Visibility(
                      visible: controller.isLoading == false,
                      replacement: const Center(child: CircularProgressIndicator()),
                      child: BannerSlider(
                      bannerDataList: controller.sliderModel.sliderDataList ?? [],
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
              
              GetBuilder<CategoryItemController>(
                builder: (categoryController) {
                  return Visibility(
                  visible: categoryController.isLoading == false,
                  replacement: const Center(child: CircularProgressIndicator()),
                    child: SizedBox(
                      height: 100,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        primary: false,
                        itemCount:  categoryController.categoryModelClass.categoryDataList?.length ?? 0,
                        itemBuilder: (context, index) {
                        CategoryDataList categoryData = categoryController.categoryModelClass.categoryDataList![index];
                          return  CategoryItemSection(
                          categoryData: categoryData,
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            width: 18,
                          );
                        },
                      ),
                    ),
                  );
                }
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
                child: GetBuilder<PopularProductLsitController>(
                builder: (popularProductListController) => 
                   Visibility(
                   visible: popularProductListController.isLoading == false,
                   replacement: const Center(child: CircularProgressIndicator()),
                     child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      primary: false,
                      itemCount: popularProductListController.productCardViewModelClass.productCardListData?.length ?? 0,
                      itemBuilder: (context, index) {
                        return  ProductItemCard(
                        productCardListData: popularProductListController.productCardViewModelClass.productCardListData![index],
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          width: 10,
                        );
                      },
                                       ),
                   ),
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
                child: GetBuilder<SpecialProductLsitController>(
                builder: (specialProductListController) => 
                   Visibility(
                   visible: specialProductListController.isLoading == false,
                   replacement: const Center(child: CircularProgressIndicator()),
                     child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      primary: false,
                      itemCount: specialProductListController.productCardViewModelClass.productCardListData?.length ?? 0,
                      itemBuilder: (context, index) {
                        return  ProductItemCard(
                        productCardListData: specialProductListController.productCardViewModelClass.productCardListData![index],
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          width: 10,
                        );
                      },
                                       ),
                   ),
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
                child: GetBuilder<NewProductLsitController>(
                builder: (newProductListController) => 
                   Visibility(
                   visible: newProductListController.isLoading == false,
                   replacement: const Center(child: CircularProgressIndicator()),
                     child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      primary: false,
                      itemCount: newProductListController.productCardViewModelClass.productCardListData?.length ?? 0,
                      itemBuilder: (context, index) {
                        return  ProductItemCard(
                        productCardListData: newProductListController.productCardViewModelClass.productCardListData![index],
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          width: 10,
                        );
                      },
                                       ),
                   ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


