import 'package:crafty_bay/presentation/ui/screens/Auth%20Screen/complete_profile_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/Auth%20Screen/verify_email_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/Auth%20Screen/verify_otp_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/Bottom%20Nav%20Screen/Fragments/cart_list_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/Bottom%20Nav%20Screen/Fragments/category_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/Bottom%20Nav%20Screen/Fragments/home_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/Bottom%20Nav%20Screen/Fragments/wish_list_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/Bottom%20Nav%20Screen/main_bottom_nav.dart';
import 'package:crafty_bay/presentation/ui/screens/Product%20Screen/products_by_category_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/Splash%20Screen/splash_screen.dart';
import 'package:crafty_bay/routes/routes_name.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
GetPage(name: RoutesName.splashScreen, page: () => const SplashScreen(),),
GetPage(name: RoutesName.verifyEmailScreen, page: () =>  VerifyEmailScreen(),),
GetPage(name: RoutesName.verifyOTPScreen, page: () =>  VerifyOtpScreen(),),
GetPage(name: RoutesName.completeProfileScreen, page: () =>  CompleteProfileScreen(),),
GetPage(name: RoutesName.mainBottonNavScreen, page: () => const MainBottomNav(),),
GetPage(name: RoutesName.homeScreen, page: () => const HomeScreen(),),
GetPage(name: RoutesName.categoryScreen, page: () => const CategoryScreen(),),
GetPage(name: RoutesName.cartListScreen, page: () => const CartListScreen(),),
GetPage(name: RoutesName.wishListScreen, page: () => const WishListScreen(),),
GetPage(name: RoutesName.productsByCategoryScreen, page: () =>  ProductsByCategoryScreen(),)
];