
import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/core/utils/app_colors.dart';
import 'package:fruits_e_commerce_app/core/utils/text_styles.dart';

class DontHaveAccountRow extends StatelessWidget
 {
  const DontHaveAccountRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
          text: 'لا تمتلك حساب؟',
          style: TextStyles.semiBold16.copyWith(
            color: AppColors.c949D9E,
          )),
      TextSpan(
        text: ' ',
      ),
      TextSpan(
          text: 'قم بانشاء حساب',
          style: TextStyles.semiBold16
              .copyWith(color: AppColors.primaryColor))
    ]));
  }
}