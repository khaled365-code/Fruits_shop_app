import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_e_commerce_app/core/utils/app_colors.dart';
import 'package:fruits_e_commerce_app/core/utils/text_styles.dart';

class OrRowWithDividersWidget extends StatelessWidget {
  const OrRowWithDividersWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            height: 1.h,
            decoration: BoxDecoration(
              color: AppColors.cE5E7E7,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: Text(
            'أو',
            style: TextStyles.semiBold16.copyWith(color: AppColors.c0C0D0D),
          ),
        ),
        Expanded(
          child: Container(
            height: 1.h,
            decoration: BoxDecoration(
              color: AppColors.cE5E7E7,
            ),
          ),
        ),
      ],
    );
  }
}
