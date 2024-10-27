import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/core/app_keys.dart';
import 'package:fruits_e_commerce_app/core/cache/cache_helper.dart';
import 'package:fruits_e_commerce_app/core/localization/localization_cubit/localization_cubit.dart';

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
