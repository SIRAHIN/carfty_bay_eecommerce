import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController {
  
  List<Color> _itemColor = [
   Colors.purple,
   Colors.pink,
   Colors.red,
   Colors.orange,
   Colors.yellow,
  ];

  List get itemColor => _itemColor;

  int _currentColorIndex = 0;
  
  void changeColorIndex (value){
    _currentColorIndex = value;
    update();
  }

  int get currentColorIndex => _currentColorIndex;


    List<String> _itemSizeChart = [
     'S',
     'M',
     'L',
     'XL',
     '2XL',
     '3XL'
  ];

  List get itemSizeChart => _itemSizeChart;

   int _currentSizeIndex = 0;
  
  void changeSizeIndex (value){
    _currentSizeIndex = value;
    update();
  }

  int get currentSizeIndex => _currentSizeIndex;

}