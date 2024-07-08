import 'package:crafty_bay/model/responseData_model.dart';
import 'package:crafty_bay/services/network_caller.dart';
import 'package:crafty_bay/utils/constants/api_urls.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReadUserProfileController extends GetxController {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  String _errorMessage = '';

  String get errorMessage => _errorMessage;

  Future<bool> readUserProfileRequest(String token) async {
    _isLoading = true;
    update();
    final ResponsedataModel response = await NetworkCaller()
        .getRequest(ApiUrls.readUserProfileUrl, token: token);
    if (response.isSuccess) {
      if (response.responseData != null || response.responseData != []) {
        _isLoading = false;
        update();
        return true;
      } else {
        _isLoading = false;
        _errorMessage = response.errorMessage;
        update();
        return false;
      }
    } else {
      _errorMessage = response.errorMessage;
      _isLoading = false;
      update();
      return false;
    }
  }
}
