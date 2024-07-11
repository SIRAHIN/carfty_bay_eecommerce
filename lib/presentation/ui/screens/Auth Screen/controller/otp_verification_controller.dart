
import 'package:crafty_bay/model/responseData_model.dart';
import 'package:crafty_bay/presentation/ui/screens/Auth%20Screen/controller/read_user_profile_controller.dart';
import 'package:crafty_bay/services/network_caller.dart';
import 'package:crafty_bay/utils/constants/api_urls.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpVerificationController extends GetxController {
  TextEditingController otpCotroller = TextEditingController();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  String _errorMessage = '';

  String get errorMessage => _errorMessage;

  String? token;

  Future<bool> verifyOtpRequest(String email, String otp) async {
    _isLoading = true;
    update();
    final ResponsedataModel response =
        await NetworkCaller().getRequest(ApiUrls.verifyOtpforEmail(email, otp));
    if (response.isSuccess) {
         _isLoading = false;
       token = response.responseData['data'];
      if (token != null || token != '') {
      await Future.delayed(const Duration(seconds: 3));
        await Get.find<ReadUserProfileController>()
            .readUserProfileRequest(token!);
        // await Future.delayed(const Duration(seconds: 3));
        if (Get.find<ReadUserProfileController>().isProfileExsit == true) {
          update();
          return true;
        }
      }
      _errorMessage = Get.find<ReadUserProfileController>().errorMessage;
      update();
      return false;
    } else {
      _isLoading = false;
      _errorMessage = Get.find<ReadUserProfileController>().errorMessage;
      update();
      return false;
    }
  }
}
