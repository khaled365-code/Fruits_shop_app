import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_e_commerce_app/core/widgets/fruits_app_bar.dart';
import 'package:fruits_e_commerce_app/core/widgets/shared_button.dart';
import 'package:fruits_e_commerce_app/core/widgets/space_widget.dart';
import 'package:fruits_e_commerce_app/features/auth/presentation/widgets/signup/already_have_account_row.dart';
import 'package:fruits_e_commerce_app/features/auth/presentation/widgets/signup/name_signup_text_field.dart';
import 'package:fruits_e_commerce_app/features/auth/presentation/widgets/signup/password_signup_text_field.dart';
import 'package:fruits_e_commerce_app/features/auth/presentation/widgets/signup/email_signup_text_field.dart';
import 'package:fruits_e_commerce_app/features/auth/presentation/widgets/signup/terms_and_conditions_row.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buidFruitsAppBar(title: 'حساب جديد'),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding:
                  EdgeInsetsDirectional.only(top: 24.h, end: 17.w, start: 16.w),
              child: Column(
                children: [
                  SignupNameTextField(),
                  SpaceWidget(
                    height: 16,
                  ),
                  SignupEmailTextField(),
                  SpaceWidget(
                    height: 16,
                  ),
                  SignupPasswordTextField(),
                  SpaceWidget(
                    height: 16,
                  ),
                  TermsAndConditionsRow(),
                  SpaceWidget(
                    height: 30,
                  ),
                  SharedButton(
                      onButtonPressed: () {}, buttonText: 'إنشاء حساب جديد'),
                  SpaceWidget(
                    height: 26,
                  ),
                  AlreadyHaveAccountRow()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
