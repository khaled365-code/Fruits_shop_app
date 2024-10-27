import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/core/utils/app_colors.dart';

class DotIndicatorWidget extends StatelessWidget {
  const DotIndicatorWidget({super.key,this.indicatorColor});
  final Color? indicatorColor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(end: 8),
      child: Container(
        width: 11,
        height: 11,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: indicatorColor?? AppColors.primaryColor),
      ),
    );
  }
}
