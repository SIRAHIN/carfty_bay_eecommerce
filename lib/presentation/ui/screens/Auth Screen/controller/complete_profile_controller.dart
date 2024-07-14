import 'package:crafty_bay/model/responseData_model.dart';
import 'package:crafty_bay/model/user_profile_data.dart';
import 'package:crafty_bay/services/network_caller.dart';
import 'package:crafty_bay/utils/constants/api_urls.dart';
import 'package:crafty_bay/utils/utility/Shared%20Preferences/app_stored_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompleteProfileController extends GetxController {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController mobileNameController = TextEditingController();
  TextEditingController cityNameController = TextEditingController();
  TextEditingController shippingAddressController = TextEditingController();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  //Model Class for User Profile Data
  UserProfileData? _userProfileData;
  UserProfileData get userProfileData => _userProfileData!;

  Future <bool> completeUserProfile(String token) async {
    _isLoading = true;
    update();
    final ResponsedataModel response =
        await NetworkCaller().postRequest(ApiUrls.createUserProfileUrl, token, {
      "firstName": firstNameController.text.trim(),
      "lastName": lastNameController.text.trim(),
      "mobile": mobileNameController.text.trim(),
      "city": cityNameController.text.trim(),
      "shippingAddress": shippingAddressController.text.trim()
    });
    if (response.isSuccess) {
      //Check user profile Exist
      final profileData = response.responseData['data'];
      // if User profiel Exsit store user data into Model class
      if (profileData != null || profileData != []) {
        _userProfileData = UserProfileData.fromJson(profileData);
        await AppStoredData.setUserProfileDetailsData(userProfileData,
            token: token);
      _isLoading = false;
      update();
      return true;
      } else {
        // Else Set bool value false that user Profile not Exsit
      _errorMessage = response.errorMessage;
      _isLoading = false;
      update();
      return false;
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
