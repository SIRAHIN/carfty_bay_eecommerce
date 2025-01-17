import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay/presentation/ui/screens/Bottom%20Nav%20Screen/Controller/Fragments%20Controller/Home%20Fragment%20Controller/banner_slider_controller.dart';
import 'package:crafty_bay/utils/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsBanner extends StatelessWidget {
   ProductDetailsBanner({
    super.key,
    required this.imgUrl
  });

  List<String> imgUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
           CarouselSlider(
            items: imgUrl.map((e) {
              return Container(
                width: MediaQuery.of(context).size.width,
                decoration:  BoxDecoration(
                image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(e.toString())),
                    // borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.grey.shade300),
                // margin: const EdgeInsets.all(1.0),
              );
            }).toList(),
            options: CarouselOptions(
              animateToClosest: true,
              height: 200,
              enlargeCenterPage: true,
              viewportFraction: 1,
              initialPage: 0,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.easeInExpo,
              onPageChanged: (index, reason) {
                Get.find<BannerSliderController>().onChangeIndex(index);
              },
              scrollDirection: Axis.horizontal,
            ),
          ),
        
        const SizedBox(
          height: 5,
        ),
        Positioned(
        bottom: 10,
        left: 0,
        right: 0,
          child: GetBuilder<BannerSliderController>(
            builder: (controller) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < imgUrl.length; i++)
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Container(
                      height: 12,
                      width: 12,
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: i == controller.currentIndex
                              ? AppColors.primaryColor
                              : Colors.white,
                       
                          borderRadius: BorderRadius.circular(30)),
                    )
                  ]),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
