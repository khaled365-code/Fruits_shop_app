import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_e_commerce_app/core/utils/app_colors.dart';
import 'package:fruits_e_commerce_app/core/utils/text_styles.dart';
import 'package:fruits_e_commerce_app/core/widgets/fruits_app_bar.dart';
import 'package:fruits_e_commerce_app/core/widgets/shared_button.dart';
import 'package:fruits_e_commerce_app/core/widgets/space_widget.dart';
import 'package:fruits_e_commerce_app/features/auth/presentation/cubits/login_cubit/cubit/login_cubit_cubit.dart';
import 'package:fruits_e_commerce_app/features/auth/presentation/widgets/login/dont_have_account_row.dart';
import 'package:fruits_e_commerce_app/features/auth/presentation/widgets/login/email_login_text_field.dart';
import 'package:fruits_e_commerce_app/features/auth/presentation/widgets/login/login_option_container.dart';
import 'package:fruits_e_commerce_app/features/auth/presentation/widgets/login/or_with_dividers_row.dart';
import 'package:fruits_e_commerce_app/features/auth/presentation/widgets/login/password_login_text_field.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buidFruitsAppBar(title: 'تسجيل دخول'),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsetsDirectional.only(
                    start: 16.w, end: 17.w, top: 24.h),
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
                          style: TextStyles.semiBold13
                              .copyWith(color: AppColors.c2D9F5D),
                        ),
                      ],
                    ),
                    SpaceWidget(
                      height: 37,
                    ),
                    SharedButton(
                        onButtonPressed: () {}, buttonText: 'تسجيل دخول'),
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
                              padding:
                                  EdgeInsets.only(top: index != 0 ? 16.h : 0),
                              child: LoginOptionContainer(
                                loginOptionsDataModel: LoginCubit.get(context)
                                    .loginOptionsDataList[index],
                              ),
                            ))
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
