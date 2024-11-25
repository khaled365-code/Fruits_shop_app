import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_e_commerce_app/core/utils/app_colors.dart';
import 'package:fruits_e_commerce_app/core/widgets/custom_outlined_text_field.dart';
import 'package:fruits_e_commerce_app/features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';

class SignupPasswordTextField extends StatelessWidget {
  const SignupPasswordTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomOutlinedTextField(
      maxLines: 1,
      obsecureText: SignupCubit.get(context).passwordObsecureText,
      controller: SignupCubit.get(context).signupPasswordController,
      hintText: 'كلمة المرور',
      validator: (value) 
      {
        if (value!.isEmpty) {
          return 'ادخل كلمة المرور';
        }
        return null;
      },
      suffixcon: Padding(
        padding: EdgeInsetsDirectional.only(end: 33.w),
        child: GestureDetector(
          onTap: () {
            SignupCubit.get(context).changePasswordEyeShape();
          },
          child: Icon(
            SignupCubit.get(context).passwordIcon,
            color: AppColors.cC9CECF,
          ),
        ),
      ),
    );
  }
}
