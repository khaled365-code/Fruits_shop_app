import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/features/onboarding/data/models/onbarding_data_model.dart';
import 'package:fruits_e_commerce_app/features/onboarding/presentation/widgets/page_view_content.dart';

class PageViewSection extends StatelessWidget {
  const PageViewSection(
      {super.key,
      required this.currentPage,
      required this.onboardingDataList,
      required this.pageViewController});

  final int currentPage;
  final List<OnboardingDataModel> onboardingDataList;
  final PageController pageViewController;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        clipBehavior: Clip.none,
        itemBuilder: (context, index) => PageViewContent(
          currentPage: currentPage,
          onboardingDataModel: onboardingDataList[index],
        ),
        controller: pageViewController,
        itemCount: onboardingDataList.length,
      ),
    );
  }
}
