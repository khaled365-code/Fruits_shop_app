
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_e_commerce_app/core/utils/app_colors.dart';
import 'package:fruits_e_commerce_app/core/widgets/custom_outlined_text_field.dart';

class SignupPasswordTextField extends StatelessWidget {
  const SignupPasswordTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomOutlinedTextField(
      controller: TextEditingController(),
      hintText: 'كلمة المرور',
      suffixcon: Padding(
        padding: EdgeInsetsDirectional.only(end: 33.w),
        child: Icon(
          Icons.remove_red_eye,
          color: AppColors.cC9CECF,
        ),
      ),
    );
  }
}