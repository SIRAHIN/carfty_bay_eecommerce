import 'dart:convert';

import 'package:crafty_bay/model/User%20Profile%20Model/user_profile_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppStoredData {
  static String? token;
  static UserProfileData? profileData;

  static Future<void> setUserProfileDetailsData(
      UserProfileData? userProfileData,
      {String? token}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token!);
    await prefs.setString(
        'profileDetails', jsonEncode(userProfileData!.toJson()));
  }

  Future<void> initalCheckUserStoredData() async {
    token = await getToken();
    profileData = await getProfileDetails();
    // Future.delayed(const Duration(seconds: 2));
  }

  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    String? userStoredToken = prefs.getString('token');
    return userStoredToken;
  }

  static Future<UserProfileData?> getProfileDetails() async {
    final prefs = await SharedPreferences.getInstance();
    String? userStoredProfileData = prefs.getString('profileDetails');
    if (userStoredProfileData == null) {
      return null;
    } else {
      return UserProfileData.fromJson(jsonDecode(userStoredProfileData));
    }
  }

  static clearUserStoredData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.clear();
  }
}
