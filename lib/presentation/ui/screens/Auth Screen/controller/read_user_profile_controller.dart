import 'dart:developer';

import 'package:crafty_bay/model/Response%20Data%20Model/responseData_model.dart';
import 'package:crafty_bay/model/User%20Profile%20Model/user_profile_data.dart';
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
      final profileData = response.responseData['data'];
      // if User profiel Exsit set user data into User Model class
      if (profileData == null ||
          profileData == 'unauthorized') {
        // if is true Set bool value false that user Profile not Exsit //
        _isProfileExsit = false;
        _errorMessage = response.errorMessage;
        update();
      } else {
        _userProfileData = UserProfileData.fromJson(profileData);
        // After setting the user data stored data into shared preferences //
        await AppStoredData.setUserProfileDetailsData(userProfileData,
            token: token);
        _isProfileExsit = true;
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

// Future readUserProfileRequest(String token) async {
//   _isLoading = true;
//   update();
  
//   final ResponsedataModel response = await NetworkCaller().getRequest(ApiUrls.readUserProfileUrl, token: token);
  
//   if (response.isSuccess) {
//     log('Read user Profile Data is success');
    
//     var profileData = response.responseData['data'];
    
//     // Ensure profileData is a Map and not null
//     if (profileData != null && profileData is Map<String, dynamic> && profileData.isNotEmpty) {
//       try {
//         _userProfileData = UserProfileData.fromJson(profileData);
//         await AppStoredData.setUserProfileDetailsData(userProfileData, token: token);
//         _isProfileExsit = true;
//       } catch (e) {
//         _errorMessage = 'Error parsing profile data: ${e.toString()}';
//         _isProfileExsit = false;
//       }
//     } else {
//       _isProfileExsit = false;
//       _errorMessage = response.errorMessage;
//     }
    
//     _isLoading = false;
//     update();
//   } else {
//     _errorMessage = response.errorMessage;
//     _isLoading = false;
//     update();
//   }
//  }
// }