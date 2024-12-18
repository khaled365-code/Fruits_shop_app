import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_e_commerce_app/core/app_keys.dart';
import 'package:fruits_e_commerce_app/core/cache/cache_helper.dart';
import 'package:fruits_e_commerce_app/core/commons/helper_functions.dart';
import 'package:fruits_e_commerce_app/core/router/routes.dart';
import 'package:fruits_e_commerce_app/core/utils/app_colors.dart';
import 'package:fruits_e_commerce_app/core/utils/text_styles.dart';
import 'package:fruits_e_commerce_app/core/widgets/space_widget.dart';
import 'package:fruits_e_commerce_app/features/onboarding/data/models/onbarding_data_model.dart';

class PageViewContent extends StatelessWidget {
  const PageViewContent(
      {super.key,
      required this.onboardingDataModel,
      required this.currentPage});
  final OnboardingDataModel onboardingDataModel;
  final int currentPage;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Image.asset(
                    onboardingDataModel.backImage,
                    fit: BoxFit.fitWidth,
                    width: MediaQuery.sizeOf(context).width,
                    color: currentPage == 0 ? AppColors.cFDF4E2 : null,
                  )),
              PositionedDirectional(
                top: 95.h,
                start: 0,
                end: 0,
                child: Image.asset(
                  onboardingDataModel.mainImage,
                ),
              ),
              currentPage == 0
                  ? Padding(
                      padding:
                          EdgeInsetsDirectional.only(start: 20.w, top: 30.h),
                      child: GestureDetector(
                        onTap: () async {
                          await CacheHelper().saveData(
                              key: AppKeys.appOnboradingSeenDone, value: true);
                          navigate(
                              context: context,
                              route: Routes.loginScreen,
                              replacement: true);
                        },
                        child: Text(
                          'تخط',
                          style: TextStyles.regular13
                              .copyWith(color: AppColors.c949D9E),
                        ),
                      ),
                    )
                  : SizedBox.shrink()
            ],
          ),
        ),
        SpaceWidget(
          height: 64,
        ),
        onboardingDataModel.title,
        SpaceWidget(
          height: 24,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 37.w),
          child: Text(
            onboardingDataModel.subTitle,
            style: TextStyles.semiBold13.copyWith(color: AppColors.c4E5556),
          ),
        )
      ],
    );
  }
}
