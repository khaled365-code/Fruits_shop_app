import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_e_commerce_app/core/commons/helper_functions.dart';
import 'package:fruits_e_commerce_app/core/utils/app_colors.dart';
import 'package:fruits_e_commerce_app/core/utils/text_styles.dart';
import 'package:fruits_e_commerce_app/core/widgets/fruits_app_bar.dart';
import 'package:fruits_e_commerce_app/core/widgets/shared_button.dart';
import 'package:fruits_e_commerce_app/core/widgets/space_widget.dart';
import 'package:fruits_e_commerce_app/features/auth/presentation/cubits/login_cubit/login_cubit_cubit.dart';
import 'package:fruits_e_commerce_app/features/auth/presentation/widgets/login/dont_have_account_row.dart';
import 'package:fruits_e_commerce_app/features/auth/presentation/widgets/login/email_login_text_field.dart';
import 'package:fruits_e_commerce_app/features/auth/presentation/widgets/login/login_option_container.dart';
import 'package:fruits_e_commerce_app/features/auth/presentation/widgets/login/or_with_dividers_row.dart';
import 'package:fruits_e_commerce_app/features/auth/presentation/widgets/login/password_login_text_field.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginCubitState>(
      listener: (context, state) {
        if (state is LoginFailureState) {
          buildScaffoldMessangerFun(
            context: context,
            title: state.message,
            isError: true,
          );
        }
        if (state is LoginSuccessState) {
          buildScaffoldMessangerFun(
            context: context,
            title: 'تم تسجيل الدخول بنجاح',
          );
        }
      },
      child: Scaffold(
          appBar: buidFruitsAppBar(title: 'تسجيل دخول'),
          body: BlocBuilder<LoginCubit, LoginCubitState>(
            builder: (context, state) {
              return ModalProgressHUD(
                inAsyncCall: state is LoginLoadingState ? true : false,
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsetsDirectional.only(
                            start: 17.w, end: 16.w, top: 24.h),
                        child: Form(
                          key: LoginCubit.get(context).loginFormKey,
                          autovalidateMode:  LoginCubit.get(context).loginFormValidateMode,
                          child: Column(
                            children: [
                              EmailLoginTextField(),
                              SpaceWidget(
                                height: 16,
                              ),
                              PasswordLoginTextField(),
                              SpaceWidget(
                                height: 16,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'نسيت كلمة المرور؟',
                                    style: TextStyles.semiBold13.copyWith(
                                        color: AppColors.lightPrimaryColor),
                                  ),
                                ],
                              ),
                              SpaceWidget(
                                height: 37,
                              ),
                              SharedButton(
                                  onButtonPressed: () {
                                    LoginCubit.get(context).onLoginPressedAction(context);
                                  },
                                  buttonText: 'تسجيل دخول'),
                              SpaceWidget(
                                height: 33,
                              ),
                              DontHaveAccountRow(),
                              SpaceWidget(
                                height: 53,
                              ),
                              OrRowWithDividersWidget(),
                              SpaceWidget(
                                height: 16,
                              ),
                              ...List.generate(
                                  3,
                                  (index) => Padding(
                                        padding: EdgeInsets.only(
                                            top: index != 0 ? 16.h : 0),
                                        child: LoginOptionContainer(
                                          loginOptionsDataModel:
                                              LoginCubit.get(context)
                                                  .loginOptionsDataList[index],
                                        ),
                                      ))
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          )),
    );
  }

  
}
