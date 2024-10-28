import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_e_commerce_app/core/utils/app_assets.dart';
import 'package:fruits_e_commerce_app/core/utils/app_colors.dart';
import 'package:svg_flutter/svg.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44.w,
      height: 44.h,
      decoration: BoxDecoration(color: AppColors.white),
      child: Padding(
        padding: EdgeInsetsDirectional.all(11.w),
        child: SvgPicture.asset(ImageConstants.appBackButtonIcon),
      ),
    );
  }
}
