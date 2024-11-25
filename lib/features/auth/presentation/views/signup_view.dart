import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_e_commerce_app/core/commons/helper_functions.dart';
import 'package:fruits_e_commerce_app/core/widgets/fruits_app_bar.dart';
import 'package:fruits_e_commerce_app/core/widgets/shared_button.dart';
import 'package:fruits_e_commerce_app/core/widgets/space_widget.dart';
import 'package:fruits_e_commerce_app/features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';
import 'package:fruits_e_commerce_app/features/auth/presentation/widgets/signup/already_have_account_row.dart';
import 'package:fruits_e_commerce_app/features/auth/presentation/widgets/signup/name_signup_text_field.dart';
import 'package:fruits_e_commerce_app/features/auth/presentation/widgets/signup/password_signup_text_field.dart';
import 'package:fruits_e_commerce_app/features/auth/presentation/widgets/signup/email_signup_text_field.dart';
import 'package:fruits_e_commerce_app/features/auth/presentation/widgets/signup/terms_and_conditions_row.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupFailureState) {
          buildScaffoldMessangerFun(
            context: context,
            title: state.message,
            isError: true,
          );
        }
        if (state is SignupSuccessState) {
          buildScaffoldMessangerFun(
            context: context,
            title: 'تم التسجيل بنجاح الرجاء تسجيل الدخول الأن',
          );
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        appBar: buidFruitsAppBar(title: 'حساب جديد'),
        body: BlocBuilder<SignupCubit, SignupState>(
          builder: (context, state) {
            return ModalProgressHUD(
              inAsyncCall: state is SignupLoadingState ? true : false,
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsetsDirectional.only(
                          top: 24.h, end: 17.w, start: 16.w),
                      child: Form(
                        key: SignupCubit.get(context).signupFormKey,
                        autovalidateMode:
                            SignupCubit.get(context).signupValidateMode,
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
                            TermsAndConditionsRow(
                              onBoxTapped: SignupCubit.get(context)
                                  .changeTermsAndConditionsValue,
                              boxIsChecked: SignupCubit.get(context)
                                  .termsAndConditionsIsChecked,
                            ),
                            SpaceWidget(
                              height: 30,
                            ),
                            SharedButton(
                                onButtonPressed: () async {
                                  if (SignupCubit.get(context)
                                      .signupFormKey
                                      .currentState!
                                      .validate()) {
                                    SignupCubit.get(context)
                                        .signupFormKey
                                        .currentState!
                                        .save();

                                    if (SignupCubit.get(context)
                                            .termsAndConditionsIsChecked ==
                                        false) {
                                      buildScaffoldMessangerFun(
                                        context: context,
                                        title:
                                            'يجب عليك الموافقه علي الشروط والاحكام',
                                        isError: true,
                                      );
                                    } else {
                                      SignupCubit.get(context)
                                          .createUserWithEmail(
                                              email: SignupCubit.get(context)
                                                  .signupEmailController
                                                  .text,
                                              name: SignupCubit.get(context)
                                                  .signupNameController
                                                  .text,
                                              password: SignupCubit.get(context)
                                                  .signupPasswordController
                                                  .text);
                                    }
                                  } else {
                                    SignupCubit.get(context)
                                        .changeSignUpValidateMode();
                                  }
                                },
                                buttonText: 'إنشاء حساب جديد'),
                            SpaceWidget(
                              height: 26,
                            ),
                            AlreadyHaveAccountRow()
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
