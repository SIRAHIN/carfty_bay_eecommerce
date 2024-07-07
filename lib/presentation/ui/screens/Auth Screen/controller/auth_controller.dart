import 'package:crafty_bay/model/responseData_model.dart';
import 'package:crafty_bay/services/network_caller.dart';
import 'package:crafty_bay/utils/constants/api_urls.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {

TextEditingController emailControler = TextEditingController();
  
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  String _errorMessage = '';

  String get errorMessage => _errorMessage;

  Future<bool> sendOtptoEmail(String email)async {
   _isLoading = true;
   final ResponsedataModel response = await NetworkCaller().getRequest(ApiUrls.sentEmailOtpUrl(email));
   
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