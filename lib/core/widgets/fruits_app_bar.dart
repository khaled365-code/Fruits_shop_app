
import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/core/utils/app_colors.dart';
import 'package:fruits_e_commerce_app/core/utils/text_styles.dart';
import 'package:fruits_e_commerce_app/core/widgets/app_back_button.dart';

buidFruitsAppBar({required String title})
{
 return AppBar(
      backgroundColor: AppColors.white,
      leading: AppBackButton(),
      title: Text(
          title,
          style: TextStyles.bold19.copyWith(color: AppColors.c0C0D0D),
        ),
      centerTitle: true,

    ); 


}