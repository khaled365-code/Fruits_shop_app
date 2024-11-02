import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_e_commerce_app/core/utils/app_assets.dart';
import 'package:fruits_e_commerce_app/core/utils/app_colors.dart';
import 'package:svg_flutter/svg.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Transform.translate(
        offset: Offset(-12, 0),
        child: Padding(
          padding: EdgeInsetsDirectional.only(start: 6.w),
          child: Container(
            width: 44.w,
            height: 44.h,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.white,
                border: Border.all(color: AppColors.cF1F1F5, width: 1.w)),
            child: Center(
                child: SvgPicture.asset(ImageConstants.appBackButtonIcon)),
          ),
        ),
      ),
    );
  }
}
