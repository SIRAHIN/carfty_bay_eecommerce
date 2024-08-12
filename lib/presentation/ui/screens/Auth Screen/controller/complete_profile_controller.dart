import 'package:crafty_bay/model/Response%20Data%20Model/responseData_model.dart';
import 'package:crafty_bay/model/User%20Profile%20Model/user_profile_data.dart';
import 'package:crafty_bay/services/network_caller.dart';
import 'package:crafty_bay/utils/constants/api_urls.dart';
import 'package:crafty_bay/utils/utility/Shared%20Preferences/app_stored_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompleteProfileController extends GetxController {
  TextEditingController customerFullNameController = TextEditingController();
  TextEditingController customerAddressController = TextEditingController();
  TextEditingController customerCityController = TextEditingController();
  TextEditingController customerStateController = TextEditingController();
  TextEditingController customerPhoneNumberController = TextEditingController();
  TextEditingController shippingAddressController = TextEditingController();
  TextEditingController shippingPhoneController = TextEditingController();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  //Model Class for User Profile Data
  UserProfileData? _userProfileData;
  UserProfileData get userProfileData => _userProfileData!;

  Future<bool> completeUserProfile(String token) async {
    Map<String, dynamic> userProfileInfo = {
      "cus_name": customerFullNameController.text,
      "cus_add": customerAddressController.text,
      "cus_city": customerCityController.text.trim(),
      "cus_state": customerStateController.text.trim(),
      "cus_phone": customerPhoneNumberController.text.trim(),
      "ship_add": shippingAddressController.text,
      "ship_phone": shippingPhoneController.text.trim(),
    };

    _isLoading = true;
    update();
    final ResponsedataModel response = await NetworkCaller()
        .postRequest(ApiUrls.createUserProfileUrl, token, userProfileInfo);
  
    if (response.isSuccess) {
      //Check user profile Exist
      final profileData = response.responseData['data'];
    
      if (profileData == null || profileData == 'unauthorized') {
        // if Set bool value false that user Profile not Exsit
        _errorMessage = response.errorMessage;
        _isLoading = false;
        update();
        return false;
      } else {
        // else User profiel Exsit store user data into Model class
        _userProfileData = UserProfileData.fromJson(profileData);
        await AppStoredData.setUserProfileDetailsData(userProfileData,
            token: token);
        _isLoading = false;
        update();
        return true;
      }
    } else {
      _errorMessage = response.errorMessage;
      _isLoading = false;
      update();
    }
    _errorMessage = response.errorMessage;
    _isLoading = false;
    update();
    return false;
  }
}
