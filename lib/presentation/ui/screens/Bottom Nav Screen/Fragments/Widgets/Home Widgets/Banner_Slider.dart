import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay/presentation/ui/screens/Bottom%20Nav%20Screen/Controller/home_controller.dart';
import 'package:crafty_bay/utils/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BannerSlider extends StatelessWidget {
  const BannerSlider({
    super.key,
    required this.homeController,
  });

  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: homeController.imageUrls.map((e) {
            return Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: AppColors.primaryColor),
              margin: const EdgeInsets.all(1.0),
            );
          }).toList(),
          options: CarouselOptions(
            enlargeCenterPage: true,
            height: 200,
            viewportFraction: 1,
            initialPage: 0,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.easeInExpo,
            onPageChanged: (index, reason) {
              homeController.onChangeIndex(index);
            },
            scrollDirection: Axis.horizontal,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        GetBuilder<HomeController>(
          builder: (controller) => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < controller.imageUrls.length; i++)
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                    height: 12,
                    width: 12,
                    margin: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        color: i == controller.currentIndex
                            ? AppColors.primaryColor
                            : Colors.transparent,
                        border: Border.all(
                          color: i == controller.currentIndex
                              ? AppColors.primaryColor
                              : Colors.grey.shade400,
                        ),
                        borderRadius: BorderRadius.circular(30)),
                  )
                ]),
            ],
          ),
        ),
      ],
    );
  }
}
