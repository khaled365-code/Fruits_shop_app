import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/core/widgets/custom_outlined_text_field.dart';
import 'package:fruits_e_commerce_app/features/auth/presentation/cubits/login_cubit/login_cubit_cubit.dart';

class EmailLoginTextField extends StatelessWidget {
  const EmailLoginTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomOutlinedTextField(
      controller: LoginCubit.get(context).emialController,
      hintText: 'البريد الإلكتروني',
      keyboardType: TextInputType.emailAddress,
      maxLines: 1,
      validator: (value) {
        if (value!.isEmpty) {
          return 'من فضلك ادخل البريد الإلكتروني';
        }
        if (EmailValidator.validate(value) == false) 
        {
          return 'البريد الإلكتروني غير صحيح';
        }
        return null;
      },
      onFieldSubmitted: (value) {
        LoginCubit.get(context).onLoginPressedAction(context);
      },
    );
  }
}
