import 'package:crafty_bay/model/Response%20Data%20Model/responseData_model.dart';
import 'package:crafty_bay/services/network_caller.dart';
import 'package:crafty_bay/utils/constants/api_urls.dart';
import 'package:crafty_bay/utils/utility/Shared%20Preferences/app_stored_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CreateReviewController extends GetxController {

TextEditingController productDesriptionController = TextEditingController();
TextEditingController ratingController = TextEditingController();
  
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  String _errorMessage = '';

  String get errorMessage => _errorMessage;



  Future<bool> createReviewByProdcutId(String productID)async {

   Map<String, dynamic> inputperams = {
    "description": productDesriptionController.text.trim(),
    "product_id": productID,
    "rating": ratingController.text.trim()
};

   _isLoading = true;
   update();
   final ResponsedataModel response = await NetworkCaller().postRequest(ApiUrls.createProductReviewUrl, AppStoredData.token, inputperams);
   if(response.isSuccess){
   _isLoading = false;
    update();
    return true;
   } else{
    _errorMessage = response.errorMessage;
    _isLoading = false;
    update();
    return false;
   }
  }
}