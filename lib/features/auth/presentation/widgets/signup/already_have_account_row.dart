import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/core/utils/app_colors.dart';
import 'package:fruits_e_commerce_app/core/utils/text_styles.dart';

class AlreadyHaveAccountRow extends StatelessWidget {
  const AlreadyHaveAccountRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
      children: [
      TextSpan(
          text: 'تمتلك حساب بالفعل؟ ',
          style: TextStyles.semiBold16
              .copyWith(color: AppColors.c949D9E)),
      TextSpan(text: ' '),
      TextSpan(
          recognizer: TapGestureRecognizer()
            ..onTap = () 
            {
              Navigator.pop(context);
            },
          text: 'تسجيل دخول',
          style: TextStyles.semiBold16
              .copyWith(color: AppColors.c1B5E37)),
    ]));
  }
}