import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/core/app_keys.dart';
import 'package:fruits_e_commerce_app/core/cache/cache_helper.dart';
import 'package:fruits_e_commerce_app/core/localization/localization_cubit/localization_cubit.dart';
import 'package:fruits_e_commerce_app/core/utils/app_assets.dart';
import 'package:fruits_e_commerce_app/core/utils/app_colors.dart';
import 'package:fruits_e_commerce_app/core/utils/text_styles.dart';
import 'package:fruits_e_commerce_app/core/widgets/space_widget.dart';
import 'package:svg_flutter/svg.dart';

navigate(
    {required BuildContext context,
    required String route,
    bool replacement = false}) {
  if (replacement == true) {
    Navigator.pushReplacementNamed(context, route);
  } else {
    Navigator.pushNamed(context, route);
  }
}

isArabic({required BuildContext context}) {
  if (CacheHelper().getData(key: AppKeys.appCurrentLanguage) == 'ar' ||
      LocalizationCubit.get(context).currentLanguage == 'ar') {
    return true;
  }
  return false;
}

buildScaffoldMessangerFun(
    {required BuildContext context,
    SnackBarBehavior? snackBarBehavior,
    bool isError = false,
    required String title}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        children: [
          isError == true
              ? SvgPicture.asset(
                  ImageConstants.closeErrorIcon,
                  colorFilter:
                      ColorFilter.mode(AppColors.white, BlendMode.srcIn),
                )
              : SizedBox.shrink(),
          isError == true
              ? SpaceWidget(
                  width: 10,
                )
              : SizedBox.shrink(),
          Text(
            title,
            style: TextStyles.regular13.copyWith(color: AppColors.white),
          )
        ],
      ),
      backgroundColor: AppColors.lightPrimaryColor,
      behavior: snackBarBehavior ?? SnackBarBehavior.floating,
      showCloseIcon: false,
      elevation: 0,
      duration: const Duration(seconds: 3),
    ),
  );
}
