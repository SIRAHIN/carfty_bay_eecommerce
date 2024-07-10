import 'dart:developer';

import 'package:crafty_bay/model/responseData_model.dart';
import 'package:crafty_bay/model/user_profile_data.dart';
import 'package:crafty_bay/services/network_caller.dart';
import 'package:crafty_bay/utils/constants/api_urls.dart';
import 'package:crafty_bay/utils/utility/Shared%20Preferences/app_stored_data.dart';
import 'package:get/get.dart';

class ReadUserProfileController extends GetxController {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  //Defined variable for checking profile Status
  bool _isProfileExsit = false;
  bool get isProfileExsit => _isProfileExsit;

  //Model Class for User Profile Data
  UserProfileData? _userProfileData;
  UserProfileData get userProfileData => _userProfileData!;

  Future readUserProfileRequest(String token) async {
    _isLoading = true;
    update();
    final ResponsedataModel response = await NetworkCaller()
        .getRequest(ApiUrls.readUserProfileUrl, token: token);
    if (response.isSuccess) {
    log('Read user Profile Data is success');
      //Check user profile Exist
      List profileData = response.responseData['data'];
      // if User profiel Exsit store user data into Model class
      print(profileData);
      if (profileData.isNotEmpty && profileData != []) {
         _userProfileData = UserProfileData.fromJson(profileData[0]);
        await AppStoredData.setUserProfileDetailsData(userProfileData, token: token);
        _isProfileExsit = true;
        update();
      } else {
      // Else Set bool value false that user Profile not Exsit
        _isProfileExsit = false;
        _errorMessage = response.errorMessage;
        update();
      }
      _isLoading = false;
      update();
    } else {
      _errorMessage = response.errorMessage;
      _isLoading = false;
      update();
    }
  }
}
