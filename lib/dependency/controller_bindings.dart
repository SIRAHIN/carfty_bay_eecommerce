import 'package:crafty_bay/presentation/ui/screens/Bottom%20Nav%20Screen/Controller/bottom_nav_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/Bottom%20Nav%20Screen/Controller/home_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/Product%20Screen/Controller/product_details_controller.dart';
import 'package:get/get.dart';

class ControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavController>(() => BottomNavController(), fenix: true);
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
     Get.lazyPut<ProductDetailsController>(() => ProductDetailsController(), fenix: true);
  }


}