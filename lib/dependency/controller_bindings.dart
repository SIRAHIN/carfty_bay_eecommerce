import 'package:crafty_bay/presentation/ui/screens/Auth%20Screen/controller/complete_profile_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/Auth%20Screen/controller/email_verification_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/Auth%20Screen/controller/otp_verification_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/Auth%20Screen/controller/read_user_profile_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/Bottom%20Nav%20Screen/Controller/bottom_nav_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/Bottom%20Nav%20Screen/Controller/home_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/Bottom%20Nav%20Screen/Controller/banner_slider_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/Product%20Screen/Controller/product_details_controller.dart';
import 'package:get/get.dart';

class ControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavController>(() => BottomNavController(), fenix: true);
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
    Get.lazyPut<ProductDetailsController>(() => ProductDetailsController(),
        fenix: true);
    Get.lazyPut<EmailVerificationController>(() => EmailVerificationController(), fenix: true);
     Get.lazyPut<OtpVerificationController>(() => OtpVerificationController(), fenix: true);
       Get.lazyPut<ReadUserProfileController>(() => ReadUserProfileController(), fenix: true);
        Get.lazyPut<CompleteProfileController>(() => CompleteProfileController(), fenix: true);
  
       Get.lazyPut<BannerSliderController>(() => BannerSliderController(), fenix: true);
  }
}
