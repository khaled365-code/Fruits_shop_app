// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_e_commerce_app/core/utils/app_assets.dart';
import 'package:fruits_e_commerce_app/core/utils/app_colors.dart';
import 'package:svg_flutter/svg.dart';

class CustomCheckBox extends StatefulWidget {
  CustomCheckBox(
      {super.key, required this.boxIsChecked, required this.onBoxTapped});

  bool boxIsChecked;
  final VoidCallback onBoxTapped;

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onBoxTapped,
      child: Container(
        width: 24.w,
        height: 24.h,
        decoration: BoxDecoration(
            color: widget.boxIsChecked == true
                ? AppColors.primaryColor
                : AppColors.transparent,
            border: Border.all(
                color: widget.boxIsChecked == true
                    ? AppColors.transparent
                    : AppColors.cDDDFDF,
                width: 1.5.w),
            borderRadius: BorderRadius.circular(8.r)),
        child: widget.boxIsChecked == true
            ? Padding(
                padding: EdgeInsets.all(4.w),
                child: SvgPicture.asset(ImageConstants.checkTrueIcon),
              )
            : SizedBox.shrink(),
      ),
    );
  }
}
