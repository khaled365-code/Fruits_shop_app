import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_e_commerce_app/core/utils/app_assets.dart';
import 'package:fruits_e_commerce_app/core/utils/app_colors.dart';
import 'package:svg_flutter/svg.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({super.key});

  static bool boxIsChecked = false;

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          CustomCheckBox.boxIsChecked = !CustomCheckBox.boxIsChecked;
        });
      },
      child: Container(
        width: 24.w,
        height: 24.h,
        decoration: BoxDecoration(
            color: CustomCheckBox.boxIsChecked == true
                ? AppColors.primaryColor
                : AppColors.transparent,
            border: Border.all(
                color: CustomCheckBox.boxIsChecked == true
                    ? AppColors.transparent
                    : AppColors.cDDDFDF,
                width: 1.5.w),
            borderRadius: BorderRadius.circular(8.r)),
        child: CustomCheckBox.boxIsChecked == true
            ? Padding(
                padding: EdgeInsets.all(4.w),
                child: SvgPicture.asset(ImageConstants.checkTrueIcon),
              )
            : SizedBox.shrink(),
      ),
    );
  }
}
