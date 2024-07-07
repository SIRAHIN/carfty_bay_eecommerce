import 'package:crafty_bay/dependency/controller_bindings.dart';
import 'package:crafty_bay/routes/routes_name.dart';
import 'package:crafty_bay/routes/routes_screen.dart';
import 'package:crafty_bay/utils/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CarftyBay extends StatelessWidget {
  const CarftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: ControllerBindings(),
      theme: ThemeData(
          fontFamily: GoogleFonts.roboto().fontFamily,
          textTheme: const TextTheme(
              labelSmall: TextStyle(
               color: AppColors.primaryColor,
               fontSize: 15,
               fontWeight: FontWeight.w700
              ),
              headlineSmall: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              titleMedium: TextStyle(color: Colors.black, fontSize: 24),
              bodySmall: TextStyle(color: Colors.grey, fontSize: 14)),
          progressIndicatorTheme:
              const ProgressIndicatorThemeData(color: AppColors.primaryColor),
          primarySwatch: MaterialColor(0xFF07ADAE, AppColors.colorSwatch),
          primaryColor: AppColors.primaryColor,
          inputDecorationTheme: InputDecorationTheme(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            hintStyle: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade500,
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.primaryColor,
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.primaryColor,
              ),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.primaryColor,
              ),
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.red,
              ),
            ),
          ),
          elevatedButtonTheme: const ElevatedButtonThemeData(
              style: ButtonStyle(
                  backgroundColor:
                      WidgetStatePropertyAll(AppColors.primaryColor),
                  foregroundColor: WidgetStatePropertyAll(Colors.white),
                  elevation: WidgetStatePropertyAll(5),
                  shape: WidgetStatePropertyAll(LinearBorder.none)))),
      title: 'Carfty Bay',
      getPages: routes,
      initialRoute: RoutesName.splashScreen,
    );
  }
}
