

import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/core/widgets/custom_outlined_text_field.dart';

class SignupNameTextField extends StatelessWidget {
  const SignupNameTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomOutlinedTextField(
      controller: TextEditingController(),
      hintText: 'الاسم كامل',
    );
  }
}