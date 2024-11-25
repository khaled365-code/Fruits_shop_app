import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_e_commerce_app/core/utils/app_colors.dart';
import 'package:fruits_e_commerce_app/core/widgets/custom_outlined_text_field.dart';
import 'package:fruits_e_commerce_app/features/auth/presentation/cubits/login_cubit/login_cubit_cubit.dart';

class PasswordLoginTextField extends StatelessWidget {
  const PasswordLoginTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomOutlinedTextField(
      controller: LoginCubit.get(context).passController,
      hintText: 'كلمة المرور',
      maxLines: 1,
      obsecureText: LoginCubit.get(context).loginPassSecureText,
      suffixcon: GestureDetector(
        onTap: () {
          LoginCubit.get(context).changePassEyeShape();
        },
        child: Padding(
          padding: EdgeInsetsDirectional.only(
            end: 33.w,
          ),
          child: Icon(
            LoginCubit.get(context).loginPassEye,
            color: AppColors.cC9CECF,
          ),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'من فضلك ادخل كلمة المرور';
        }
        return null;
      },
       onFieldSubmitted: (value)
      {
        LoginCubit.get(context).onLoginPressedAction(context);
      },
    );
  }
}
