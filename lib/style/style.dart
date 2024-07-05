 import 'package:crafty_bay/utils/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

SvgPicture svgImage(context, svgImgPath,  [ sizeofWidth, sizeofHeight, isfit]){
  return SvgPicture.asset(
    svgImgPath,
    alignment: Alignment.center,
    width: MediaQuery.of(context).size.width* sizeofWidth,
    height: MediaQuery.of(context).size.height * sizeofHeight,
    fit: isfit == true ? BoxFit.cover : BoxFit.contain ,
  );
}

PinTheme AppOTPStyle(){
  return  PinTheme(
    inactiveColor: Colors.blueAccent,
    inactiveFillColor: Colors.white,
    selectedColor: AppColors.primaryColor,
    activeColor: AppColors.primaryColor,
   // selectedFillColor: colorGreen,
    shape: PinCodeFieldShape.box,
    borderRadius: BorderRadius.circular(5),
    fieldHeight: 50,
    borderWidth: 0.5,
    fieldWidth: 45,
    activeFillColor: Colors.white,
  );
}
