import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/core/widgets/custom_outlined_text_field.dart';
import 'package:fruits_e_commerce_app/features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';

class SignupEmailTextField extends StatelessWidget {
  const SignupEmailTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomOutlinedTextField(
      maxLines: 1,
      validator: (value) {
        if (value!.isEmpty) {
          return 'يجب ادخال البريد الإلكتروني';
        }
        if(EmailValidator.validate(value)==false)
        {
          return 'البريد الإلكتروني غير صحيح';
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
      controller: SignupCubit.get(context).signupEmailController,
      hintText: 'البريد الإلكتروني',
      onFieldSubmitted: (value)
      {
        SignupCubit.get(context).onSignupPressedAction(context);
      },
    );
  }
}
