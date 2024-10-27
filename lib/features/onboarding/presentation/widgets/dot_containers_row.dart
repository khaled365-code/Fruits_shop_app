import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/core/utils/app_colors.dart';
import 'package:fruits_e_commerce_app/features/onboarding/presentation/widgets/dot_container_widget.dart';

class DotContainersRow extends StatelessWidget {
  const DotContainersRow({super.key, required this.currentPage});

  final int currentPage;
  @override
  Widget build(BuildContext context) {
    return currentPage == 0
        ? Row(
          mainAxisAlignment: MainAxisAlignment.center, 
          children: [
            DotIndicatorWidget(),
            DotIndicatorWidget(
              indicatorColor: AppColors.c5DB957,
            ),
          ])
        : Row(
            mainAxisAlignment: MainAxisAlignment.center, 
            children: List.generate(2, (index) => DotIndicatorWidget()),
          );
  }
}
