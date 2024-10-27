import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/core/utils/app_colors.dart';
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
        Stack(
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
              top: 120,
              start: 0,
              end: 0,
              child: Image.asset(
                onboardingDataModel.mainImage,
              ),
            ),
            currentPage == 0
                ? Padding(
                    padding: EdgeInsetsDirectional.only(start: 20, top: 30),
                    child: Text('تخط'),
                  )
                : SizedBox.shrink()
          ],
        ),
        SizedBox(
          height: 64,
        ),
        onboardingDataModel.title,
        SizedBox(
          height: 24,
        ),
        Text(onboardingDataModel.subTitle),
      ],
    );
  }
}
