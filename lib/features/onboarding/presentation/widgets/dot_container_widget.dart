import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_e_commerce_app/core/utils/app_colors.dart';

class DotIndicatorWidget extends StatelessWidget {
  const DotIndicatorWidget({super.key,this.indicatorColor});
  final Color? indicatorColor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsetsDirectional.only(end: 8.w),
      child: Container(
        width: 11.w,
        height: 11.h,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: indicatorColor?? AppColors.primaryColor),
      ),
    );
  }
}
