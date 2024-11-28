import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_e_commerce_app/core/utils/app_colors.dart';
import 'package:fruits_e_commerce_app/core/utils/text_styles.dart';
import 'package:fruits_e_commerce_app/core/widgets/space_widget.dart';
import 'package:fruits_e_commerce_app/features/auth/data/models/login_options_data_model.dart';
import 'package:fruits_e_commerce_app/features/auth/presentation/cubits/login_cubit/login_cubit_cubit.dart';
import 'package:svg_flutter/svg.dart';

class LoginOptionContainer extends StatelessWidget {
  const LoginOptionContainer(
      {super.key, required this.loginOptionsDataModel, required this.index});
  final LoginOptionsDataModel loginOptionsDataModel;
  final int index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        switch (index) {
          case 0:
            LoginCubit.get(context).loginWithGoogleFun();
            break;
          case 2:
            LoginCubit.get(context).loginWithFacebookFun();
            break;
        }
      },
      child: Container(
        height: 56.h,
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: AppColors.cDDDFDF, width: 1.w)),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.only(start: 15.5.w),
              child: SvgPicture.asset(loginOptionsDataModel.optionIcon),
            ),
            SpaceWidget(
              width: 53,
            ),
            Text(
              loginOptionsDataModel.optionName,
              style: TextStyles.semiBold16.copyWith(color: AppColors.c0C0D0D),
            ),
          ],
        ),
      ),
    );
  }
}
