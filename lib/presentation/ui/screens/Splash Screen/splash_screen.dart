import 'package:crafty_bay/routes/routes_name.dart';
import 'package:crafty_bay/style/style.dart';
import 'package:crafty_bay/utils/constants/asset_paths.dart';
import 'package:crafty_bay/utils/utility/Shared%20Preferences/app_stored_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();

}


class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState()  {
   Future.delayed(const Duration(seconds: 2), () async {
      await AppStoredData().initalCheckUserStoredData();
      _guestUserPermission();
    });
    super.initState();
  }

  void _guestUserPermission (){
  //  if((AppStoredData.token != null || AppStoredData.token != '') && (AppStoredData.profileData != null) ){
    Get.offAllNamed(RoutesName.mainBottonNavScreen);
  //  } else{
  //   Get.offAllNamed(RoutesName.verifyEmailScreen);
  //  }
    
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          const  SizedBox(
              height: 140,
            ),
            svgImage(context, AssetPaths.appLogo, .1, .15),
            const Column(
              children: [
                CircularProgressIndicator(),
                SizedBox(
                  height: 10,
                ),
                Text('version 1.0'),
                SizedBox(
                  height: 20,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
