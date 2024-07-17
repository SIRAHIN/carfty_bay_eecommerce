import 'dart:convert';

import 'package:crafty_bay/model/user_profile_data.dart';
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


   Future <void> initalCheckUserStoredData() async {
    token = await getToken();
    profileData = await getProfileDetails();
    Future.delayed(const Duration(seconds: 2));
  }

  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    String? userStoredData = prefs.getString('token');
    return userStoredData;
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
}
