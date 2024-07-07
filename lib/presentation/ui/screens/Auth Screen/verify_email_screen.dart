import 'package:crafty_bay/presentation/ui/screens/Auth%20Screen/controller/auth_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/Auth%20Screen/verify_otp_screen.dart';
import 'package:crafty_bay/routes/routes_name.dart';
import 'package:crafty_bay/style/style.dart';
import 'package:crafty_bay/utils/constants/asset_paths.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatelessWidget {
   VerifyEmailScreen({super.key});

   final GlobalKey<FormState> _formKey =  GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
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
                validator: (value) {
                  if (value!.isEmpty) {
                   return 'Enter your Email';
                  } else if(!value.endsWith('@gmail.com')){
                   return 'Use vaild Email Address';
                  }
                  return null;
                },
                controller: Get.find<AuthController>().emailControler,
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
                  child: ElevatedButton(onPressed: () async {
                  if(_formKey.currentState!.validate()){
                   bool isSuccess = await Get.find<AuthController>().sendOtptoEmail(Get.find<AuthController>().emailControler.text.trim());
                   if(isSuccess){
                    Get.offNamed(RoutesName.verifyOTPScreen);
                   } else{
                    Get.snackbar('Login Error', 'Something Went Wrong');
                   }
                  }
                 
                  }, child: const Text("Next")),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
