import 'package:crafty_bay/routes/routes_name.dart';
import 'package:crafty_bay/style/style.dart';
import 'package:crafty_bay/utils/constants/asset_paths.dart';
import 'package:crafty_bay/utils/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyOtpScreen extends StatelessWidget {
  const VerifyOtpScreen({super.key});

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
              'Enter OTP Code',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'A 4 Digit OTP Code Has Been Sents',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 250,
              child: PinCodeTextField(
                appContext: context,
                length: 4,
                pinTheme: AppOTPStyle(),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child:
                    ElevatedButton(onPressed: () {
                     Get.toNamed(RoutesName.completeProfileScreen);
                    }, child: const Text("Next")),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'This code Expaind in ',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const Text(
                  '120s',
                  style: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
            Text('Resend Code', style: Theme.of(context).textTheme.bodySmall)
          ],
        ),
      ),
    );
  }
}
