// ignore_for_file: must_be_immutable

import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay/model/Slider%20Model/sliderDataList.dart';
import 'package:crafty_bay/presentation/ui/screens/Bottom%20Nav%20Screen/Controller/Fragments%20Controller/Home%20Fragment%20Controller/banner_slider_controller.dart';
import 'package:crafty_bay/utils/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BannerSlider extends StatelessWidget {
  BannerSlider({super.key, required this.bannerDataList});

  List<SliderDataList> bannerDataList;

  //List<SliderDataList> dataList = Get.find<BannerSliderController>().bannerDataList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: bannerDataList.map((e) {
            return Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      e.image ??
                          'https://www.notebookcheck.net/fileadmin/Notebooks/News/_nc3/m1_macs_banner.jpg',
                    ),
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: AppColors.primaryColor),
              margin: const EdgeInsets.all(1.0),

              // Banner Inside Section //
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //Banner Titel And Button Section //
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Banner Title //
                        Text(
                          e.title.toString(),
                          style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),

                        const SizedBox(
                          height: 10,
                        ),

                        // Btn section //
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: SizedBox(
                            width: 100,
                            height: 30,
                            child: ElevatedButton(
                                style: const ButtonStyle(
                                    elevation: WidgetStatePropertyAll(0),
                                    backgroundColor:
                                        WidgetStatePropertyAll(Colors.black)),
                                onPressed: () {},
                                child: const Text(
                                  'Buy Now',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.white),
                                )),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
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
            onPageChanged: (index, _) {
              Get.find<BannerSliderController>().onChangeIndex(index);
            },
            scrollDirection: Axis.horizontal,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        // Banner Under pin point section //
        GetBuilder<BannerSliderController>(
          builder: (controller) => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < bannerDataList.length; i++)
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
