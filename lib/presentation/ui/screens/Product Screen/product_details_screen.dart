import 'package:crafty_bay/presentation/ui/screens/Bottom%20Nav%20Screen/Controller/banner_slider_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/Bottom%20Nav%20Screen/Controller/home_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/Product%20Screen/Controller/product_details_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/Product%20Screen/widgets/product_bannerSlider.dart';
import 'package:crafty_bay/presentation/ui/screens/Review%20Screen/review_list_screen.dart';
import 'package:crafty_bay/utils/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  HomeController get homeController => Get.find();
  ProductDetailsController get productDetailsController => Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Product Details"),
          leading: IconButton(
              onPressed: () {}, icon: const Icon(Icons.arrow_back_ios_new_rounded)),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Banner Slider Section //
               ProductBannerSlider(
               bannerList: Get.find<BannerSliderController>().sliderModel.sliderDataList ?? [],
               ),
          
              // Main Body Section //
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
              
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        // Product Title //
                        Expanded(
                            child: Text(
                          'Happy New year Special Deal Save 30%',
                          style: Theme.of(context).textTheme.titleMedium,
                          maxLines: 2,
                        )),
          
                        // Add and Remove Btn Section //
                        Row(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Container(
                                alignment: Alignment.center,
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                    color: AppColors.primaryColor,
                                    borderRadius: BorderRadius.circular(5)),
                                child: const Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                  size: 12,
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4),
                              child: Text('01'),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                alignment: Alignment.center,
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                    color: AppColors.primaryColor,
                                    borderRadius: BorderRadius.circular(5)),
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
          
                    // Rating and Reviews Section //
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            Text("4.8"),
                          ],
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                            onTap: () {},
                            child: Text(
                              "Reviews",
                              style: Theme.of(context).textTheme.labelSmall,
                            )),
                        const SizedBox(
                          width: 10,
                        ),
                        const CircleAvatar(
                          radius: 10,
                          backgroundColor: AppColors.primaryColor,
                          child: Icon(
                            Icons.favorite,
                            size: 12,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
          
                    const SizedBox(
                          height: 10,
                        ),
          
                  
                  
          
                    // Color Section //    
                  const  Text("Color", style: TextStyle(
                     fontSize: 20,
                     fontWeight: FontWeight.w500
                    ),
                    ),
          
                    SizedBox(
                    height: 40,
                      child: GetBuilder<ProductDetailsController>(
                      builder: (controller) => 
                      ListView.separated(
                      separatorBuilder: (context, index) => const SizedBox(width: 10,),   
                      itemCount: controller.itemColor.length, 
                      shrinkWrap: true,
                      primary: false,
                      scrollDirection: Axis.horizontal,
                      physics: const NeverScrollableScrollPhysics(),          
                      itemBuilder: (context, index) {
                         return GestureDetector(
                         onTap: () {
                          controller.changeColorIndex(index);
                      
                         },
                           child:  CircleAvatar(
                           backgroundColor: controller.itemColor[index],
                            radius: 16,
                           child: controller.currentColorIndex == index ?  const Icon(Icons.check, color:Colors.white, size: 18,) : const SizedBox(),
                           ),
                         );                 
                        },
                        ),
                      ),
                    ),
          
                    const SizedBox(height: 10,),
          
                      // Size Section //    
                    const Text("Size", style: TextStyle(
                     fontSize: 20,
                     fontWeight: FontWeight.w500
                    ),
                    ),
          
                    SizedBox(
                    height: 40,
                      child: GetBuilder<ProductDetailsController>(
                      builder: (controller) => 
                      ListView.separated(
                      separatorBuilder: (context, index) => const SizedBox(width: 10,),   
                      itemCount: controller.itemSizeChart.length, 
                      shrinkWrap: true,
                      primary: false,
                      scrollDirection: Axis.horizontal,
                      physics: const NeverScrollableScrollPhysics(),          
                      itemBuilder: (context, index) {
                         return GestureDetector(
                         onTap: () {
                          controller.changeSizeIndex(index);
                      
                         },
                           child:  CircleAvatar(
                  
                           backgroundColor: controller.currentSizeIndex == index ? AppColors.primaryColor : Colors.grey.withOpacity(0.2),
                            radius: 16,
                           child:   Text(controller.itemSizeChart[index], style: TextStyle(
                           fontSize: 13,
                            color: controller.currentSizeIndex == index ? Colors.white : Colors.black,
                            fontWeight: FontWeight.w700
                           ),) ,
                           ),
                         );                 
                        },
                        ),
                      ),
                    ),
          
                    // Description Section //  
                    const SizedBox(height: 15,),
          
                     Text('Descoption', style: Theme.of(context).textTheme.titleMedium ,),
                     const Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. I")
          
                    
                  ],
                ),
              ),
              // Bottom Section //
                  Container(
              height: 80,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  color: AppColors.primaryColor.withOpacity(0.2)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Price'),
                        Text(
                          '\$100,000.00',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primaryColor),
                        ),
                      ],
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: SizedBox(
                        width: 130,
                        child: ElevatedButton(
                            style: const ButtonStyle(
                                elevation: WidgetStatePropertyAll(0)),
                            onPressed: () {
                            Get.to(const ReviewListScreen());
                            },
                            child: const Text("Add to Cart")),
                      ),
                    )
                  ],
                ),
              ),
            )

            ],
          ),
        )
        );
  }
}
