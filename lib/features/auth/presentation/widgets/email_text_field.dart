

import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/core/widgets/custom_outlined_text_field.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomOutlinedTextField(
      controller: TextEditingController(),
      hintText: 'البريد الإلكتروني',
      keyboardType: TextInputType.emailAddress,
      maxLines: 1,
    );
  }
}