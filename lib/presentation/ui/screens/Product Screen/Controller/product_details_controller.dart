import 'package:crafty_bay/model/Product%20Details%20Model/product_details_model.dart';
import 'package:crafty_bay/model/Response%20Data%20Model/responseData_model.dart';
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
  List get itemColor => _itemColor;

  // Function to convert hex string to Color
  // Color hexToColor(String hexString) {
  //   final buffer = StringBuffer();
  //   if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
  //   buffer.write(hexString.replaceFirst('#', ''));
  //   _itemColor.add(Color(int.parse(buffer.toString(), radix: 16)));
  //   return Color(int.parse(buffer.toString(), radix: 16));
  // }

  Color colorStringNameToColor(String colorName){
   String colorNameToUpperCase = colorName.toUpperCase();
   if(colorNameToUpperCase == 'RED'){
    return Colors.red;
   } else if (colorNameToUpperCase == 'GREEN'){
    return Colors.green;
   } else if (colorNameToUpperCase == 'WHITE'){
    return Colors.white;
   } else {
    return Colors.grey;
   }
  }
  
  // Getting Selected Color //

  int _currentColorIndex = 0;
  int get currentColorIndex => _currentColorIndex;
  
  void changeColorIndex (value){
    _currentColorIndex = value;
    update();
  }
  
  
  // Getting Selected Size //
  
  int _currentSizeIndex = 0;
  int get currentSizeIndex => _currentSizeIndex;
  
  void changeSizeIndex (value){
    _currentSizeIndex = value;
    update();
  }


}