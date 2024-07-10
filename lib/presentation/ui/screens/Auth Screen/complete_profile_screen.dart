import 'package:crafty_bay/presentation/ui/screens/Auth%20Screen/controller/complete_profile_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/Auth%20Screen/controller/otp_verification_controller.dart';
import 'package:crafty_bay/routes/routes_name.dart';
import 'package:crafty_bay/style/style.dart';
import 'package:crafty_bay/utils/constants/asset_paths.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompleteProfileScreen extends StatelessWidget {
  CompleteProfileScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  CompleteProfileController get completeProfileController => Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
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
                    'Complete Profile',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Get Started with us with your details',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: completeProfileController.firstNameController,
                    decoration: const InputDecoration(
                      hintText: 'First Name',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter your First Name';
                      } 
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                   validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter your Last Name';
                      } 
                      return null;
                    },
                    controller: completeProfileController.lastNameController,
                    decoration: const InputDecoration(
                      hintText: 'Last Name',
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                   validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter your Mobile Number';
                      } 
                      return null;
                    },
                    controller: completeProfileController.mobileNameController,
                    decoration: const InputDecoration(
                      hintText: 'Mobile',
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                   validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter your City Name';
                      } 
                      return null;
                    },
                    controller: completeProfileController.cityNameController,
                    decoration: const InputDecoration(
                      hintText: 'City',
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                   validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter your Shipping Address';
                      } 
                      return null;
                    },
                    controller:
                        completeProfileController.shippingAddressController,
                    maxLines: 3,
                    decoration: const InputDecoration(
                      hintText: 'Shopping Address',
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                        bool isSuccess = await completeProfileController.completeUserProfile(Get.find<OtpVerificationController>().token!);
                        if(isSuccess){
                         Get.toNamed(RoutesName.mainBottonNavScreen);
                        } else if(isSuccess == false) {
                         Get.toNamed(RoutesName.verifyEmailScreen);
                         
                        } else {
                         Get.snackbar('OTP', completeProfileController.errorMessage);
                        }
                            }
                          },
                          child: const Text("Next")),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
