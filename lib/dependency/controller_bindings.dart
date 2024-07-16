import 'package:crafty_bay/presentation/ui/screens/Auth%20Screen/controller/complete_profile_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/Auth%20Screen/controller/email_verification_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/Auth%20Screen/controller/otp_verification_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/Auth%20Screen/controller/read_user_profile_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/Bottom%20Nav%20Screen/Controller/Home%20Fragment%20Controller/new_product_lsit_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/Bottom%20Nav%20Screen/Controller/Home%20Fragment%20Controller/special_product_lsit_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/Bottom%20Nav%20Screen/Controller/bottom_nav_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/Bottom%20Nav%20Screen/Controller/Home%20Fragment%20Controller/category_item_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/Bottom%20Nav%20Screen/Controller/Home%20Fragment%20Controller/banner_slider_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/Bottom%20Nav%20Screen/Controller/Home%20Fragment%20Controller/popular_product_lsit_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/Product%20Screen/Controller/product_by_category_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/Product%20Screen/Controller/product_details_controller.dart';
import 'package:get/get.dart';

class ControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavController>(() => BottomNavController(), fenix: true);
    Get.lazyPut<ProductDetailsController>(() => ProductDetailsController(),
        fenix: true);
    Get.lazyPut<EmailVerificationController>(
        () => EmailVerificationController(),
        fenix: true);
    Get.lazyPut<OtpVerificationController>(() => OtpVerificationController(),
        fenix: true);
    Get.lazyPut<ReadUserProfileController>(() => ReadUserProfileController(),
        fenix: true);
    Get.lazyPut<CompleteProfileController>(() => CompleteProfileController(),
        fenix: true);

    Get.lazyPut<BannerSliderController>(() => BannerSliderController(),
        fenix: true);
    Get.lazyPut<CategoryItemController>(() => CategoryItemController(),
        fenix: true);
    Get.lazyPut<ProductByCategoryController>(
        () => ProductByCategoryController(),
        fenix: true);
         Get.lazyPut<PopularProductLsitController>(
        () => PopularProductLsitController(),
        fenix: true);

          Get.lazyPut<SpecialProductLsitController>(
        () => SpecialProductLsitController(),
        fenix: true);

        
          Get.lazyPut<NewProductLsitController>(
        () => NewProductLsitController(),
        fenix: true);

         
          Get.lazyPut<ProductDetailsController>(
        () => ProductDetailsController(),
        fenix: true);
        
  }
}
