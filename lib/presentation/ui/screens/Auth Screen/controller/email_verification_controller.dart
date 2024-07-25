import 'package:crafty_bay/model/Response%20Data%20Model/responseData_model.dart';
import 'package:crafty_bay/services/network_caller.dart';
import 'package:crafty_bay/utils/constants/api_urls.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailVerificationController extends GetxController {

TextEditingController emailControler = TextEditingController();
  
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  String _errorMessage = '';

  String get errorMessage => _errorMessage;

  Future<bool> sendOtptoEmail(String email)async {
   _isLoading = true;
   update();
   final ResponsedataModel response = await NetworkCaller().getRequest(ApiUrls.sentEmailForOtpUrl(email));
   
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