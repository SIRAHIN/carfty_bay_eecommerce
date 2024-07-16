import 'package:crafty_bay/model/Product%20Details%20Model/proddut_details_data_list.dart';
import 'package:crafty_bay/model/Product%20Details%20Model/product_details_model.dart';
import 'package:crafty_bay/model/responseData_model.dart';
import 'package:crafty_bay/services/network_caller.dart';
import 'package:crafty_bay/utils/constants/api_urls.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController {


  bool _isLoading = false;

  bool get isLoading => _isLoading;

  String _errorMessage = '';

  String get errorMessage => _errorMessage;

  ProductDetailsModel _productDetailsModelClass = ProductDetailsModel();

   ProductDetailsModel get productDetailsModelClass => _productDetailsModelClass;

  // List<ProductDetailsDataList>? productDetailsDataList;


  //Get Product Card View Data// 
  Future getProductDetailsByProductId({required String id}) async {
    _isLoading = true;
    update();
    final ResponsedataModel response =
        await NetworkCaller().getRequest(ApiUrls.productDetailsByProductId(id));
    if (response.isSuccess) {
       _productDetailsModelClass = ProductDetailsModel.fromJson(response.responseData);
      _isLoading = false;
      update();
    } else {
      _errorMessage = response.errorMessage;
      _isLoading = false;
      update();
    }
  }


  

  // Color List
  final List<Color> _itemColor = [];

  // Function to convert hex string to Color
  Color hexToColor(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    _itemColor.add(Color(int.parse(buffer.toString(), radix: 16)));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  List get itemColor => _itemColor;

  int _currentColorIndex = 0;
  
  void changeColorIndex (value){
    _currentColorIndex = value;
    update();
  }

  int get currentColorIndex => _currentColorIndex;


  // List for Size Chart
  //   final List<String> _itemSizeChart = [
  //    'S',
  //    'M',
  //    'L',
  //    'XL',
  //    '2XL',
  //    '3XL'
  // ];

  // List get itemSizeChart => _itemSizeChart;

   int _currentSizeIndex = 0;
  
  void changeSizeIndex (value){
    _currentSizeIndex = value;
    update();
  }

  int get currentSizeIndex => _currentSizeIndex;

}