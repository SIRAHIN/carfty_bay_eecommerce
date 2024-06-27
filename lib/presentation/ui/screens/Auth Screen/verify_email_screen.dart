import 'package:crafty_bay/routes/routes_name.dart';
import 'package:crafty_bay/style/style.dart';
import 'package:crafty_bay/utils/constants/asset_paths.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            svgImage(context, AssetPaths.appLogo, 1, .15),
           const SizedBox(
              height: 30,
            ),
            Text(
              'Welcome Back',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Please Enter Your Email Address',
              style: Theme.of(context).textTheme.bodySmall,
            ),
           const  SizedBox(
              height: 30,
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Email Address',
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: ElevatedButton(onPressed: () {
                Get.offNamed(RoutesName.verifyOTPScreen);
                }, child: const Text("Next")),
              ),
            )
          ],
        ),
      ),
    );
  }
}
