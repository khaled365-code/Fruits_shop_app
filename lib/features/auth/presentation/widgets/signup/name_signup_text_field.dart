import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/core/widgets/custom_outlined_text_field.dart';
import 'package:fruits_e_commerce_app/features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';

class SignupNameTextField extends StatelessWidget {
  const SignupNameTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomOutlinedTextField(
      maxLines: 1,
      validator: (value) 
      {
        if(value!.isEmpty)
        {
          return 'ادخل الاسم كامل';
        }
        else
        {
          return null;
        }
      },
      keyboardType: TextInputType.name,
      controller: SignupCubit.get(context).signupNameController,
      hintText: 'الاسم كامل',
    );
  }
}
