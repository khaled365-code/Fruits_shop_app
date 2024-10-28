import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_e_commerce_app/core/utils/app_colors.dart';
import 'package:fruits_e_commerce_app/core/utils/text_styles.dart';

class SharedButton extends StatelessWidget {
  const SharedButton(
      {super.key,
      required this.onButtonPressed,
      this.bordderRadiusValue,
      required this.buttonText});

  final VoidCallback onButtonPressed;
  final double? bordderRadiusValue;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          fixedSize: Size(343.w, 54.h),
          elevation: 0,
          backgroundColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(bordderRadiusValue ?? 16).r),
        ),
        onPressed: onButtonPressed,
        child: Text(
          buttonText,
          style: TextStyles.bold16.copyWith(color: AppColors.white),
        ));
  }
}
