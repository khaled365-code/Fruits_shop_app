import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/core/utils/app_colors.dart';
import 'package:fruits_e_commerce_app/core/utils/text_styles.dart';
import 'package:fruits_e_commerce_app/core/widgets/app_back_button.dart';

class CustomAuthAppBar extends StatelessWidget {
  const CustomAuthAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AppBackButton(),
        Spacer(),
        Text(
          'تسجيل دخول',
          style: TextStyles.bold19.copyWith(color: AppColors.c0C0D0D),
        ),
        Spacer(
          flex: 2,
        ),
      ],
    );
  }
}
