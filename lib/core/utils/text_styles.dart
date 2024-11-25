import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_e_commerce_app/core/utils/size_config.dart';

abstract class TextStyles {
  static TextStyle bold13 = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 13.sp,
  );
  static TextStyle bold23 = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 23.sp,
  );

  static TextStyle semiBold13 = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 13.sp,
  );

  static TextStyle regular13 = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 13.sp,
  );

  static TextStyle bold16 = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16.sp,
  );

  static TextStyle bold19 = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 19.sp,
  );

  static TextStyle semiBold16 = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 16.sp,
  );

  static TextStyle bold28 = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 28.sp,
  );

  static TextStyle regular22 = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 22.sp,
  );

  static TextStyle semiBold11 = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 11.sp,
  );

  static TextStyle medium15 = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 15.sp,
  );

  static TextStyle regular26 = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 26.sp,
  );

  static TextStyle regular16 = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 16.sp,
  );

  static TextStyle regular11 = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 11.sp,
  );

  double getResponsiveFontSize(BuildContext context, double fontSize) 
  {
    double scaleFactor = getScaleFactor(context);
    double responsiveFontSize = scaleFactor * fontSize;
    double minSize = fontSize * .8;
    double maxSize = fontSize * 1.2;
    return responsiveFontSize.clamp(minSize, maxSize);
  }

  double getScaleFactor(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    if (width < SizeConfig.tabletSize) {
      return width / 400;
    } else if (width < SizeConfig.desktopSize) {
      return width / 700;
    }
    return width / 1000;
  }
}
