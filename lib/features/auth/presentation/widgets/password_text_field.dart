import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_e_commerce_app/core/utils/app_assets.dart';
import 'package:fruits_e_commerce_app/core/utils/app_colors.dart';
import 'package:fruits_e_commerce_app/core/widgets/custom_outlined_text_field.dart';
import 'package:svg_flutter/svg.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomOutlinedTextField(
      controller: TextEditingController(),
      hintText: 'كلمة المرور',
      maxLines: 1,
      obsecureText: true,
      suffixcon: Padding(
        padding: EdgeInsetsDirectional.only(
          end: 33.w,
        ),
        child: Icon(
          Icons.remove_red_eye,
          color: AppColors.cC9CECF,
        ),
      ),
    );
  }
}
