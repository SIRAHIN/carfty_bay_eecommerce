import 'package:crafty_bay/presentation/ui/screens/Auth%20Screen/complete_profile_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/Auth%20Screen/verify_email_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/Auth%20Screen/verify_otp_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/Splash%20Screen/splash_screen.dart';
import 'package:crafty_bay/routes/routes_name.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
GetPage(name: RoutesName.splashScreen, page: () => const SplashScreen(),),
GetPage(name: RoutesName.verifyEmailScreen, page: () => const VerifyEmailScreen(),),
GetPage(name: RoutesName.verifyOTPScreen, page: () => const VerifyOtpScreen(),),
GetPage(name: RoutesName.completeProfileScreen, page: () => const CompleteProfileScreen(),)
];