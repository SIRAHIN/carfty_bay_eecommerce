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
                    controller: completeProfileController.customerFullNameController,
                    decoration: const InputDecoration(
                      hintText: 'Customer Full Name',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Customer Customer Full  Name';
                      } 
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                   maxLines: 2,
                   validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Customer Address';
                      } 
                      return null;
                    },
                    controller: completeProfileController.customerAddressController,
                    decoration: const InputDecoration(
                      hintText: 'Customer Address',
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                   validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Customer City';
                      } 
                      return null;
                    },
                    controller: completeProfileController.customerCityController,
                    decoration: const InputDecoration(
                      hintText: 'Customer City',
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                   validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Customer State';
                      } 
                      return null;
                    },
                    controller: completeProfileController.customerStateController,
                    decoration: const InputDecoration(
                      hintText: 'Customer State',
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                   TextFormField(
                   validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Customer Phone Number';
                      } 
                      return null;
                    },
                    controller:
                        completeProfileController.customerPhoneNumberController,
                  
                    decoration: const InputDecoration(
                      hintText: 'Customer Phone Number',
                    ),
                  ),
                  const SizedBox(
                    height: 25,
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
                    maxLines: 2,
                    decoration: const InputDecoration(
                      hintText: 'Shipping Address',
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                    TextFormField(
                   validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter your Shipping Phone Number';
                      } 
                      return null;
                    },
                    controller:
                        completeProfileController.shippingPhoneController,
                    decoration: const InputDecoration(
                      hintText: 'Shipping Phone Number',
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: GetBuilder<CompleteProfileController>(
                      builder: (controller) => 
                         Visibility(
                         visible: controller.isLoading == false,
                         replacement: const Center(child: CircularProgressIndicator()),
                           child: ElevatedButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                      
                            bool isSuccess = await controller.completeUserProfile(Get.find<OtpVerificationController>().token!);
      
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
                      ),
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
