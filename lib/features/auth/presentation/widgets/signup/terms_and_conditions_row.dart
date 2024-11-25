import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/core/utils/app_colors.dart';
import 'package:fruits_e_commerce_app/core/utils/text_styles.dart';
import 'package:fruits_e_commerce_app/core/widgets/custom_check_box.dart';
import 'package:fruits_e_commerce_app/core/widgets/space_widget.dart';

class TermsAndConditionsRow extends StatelessWidget {
  const TermsAndConditionsRow({
    super.key,
    required this.boxIsChecked, required this.onBoxTapped,
  });

  final bool boxIsChecked;
  final VoidCallback onBoxTapped;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomCheckBox(
          boxIsChecked: boxIsChecked,
          onBoxTapped: onBoxTapped,
        ),
        SpaceWidget(
          width: 16,
        ),
        Expanded(
          child: RichText(
              text: TextSpan(children: [
            TextSpan(
                text: 'من خلال إنشاء حساب ، فإنك توافق على ',
                style:
                    TextStyles.semiBold13.copyWith(color: AppColors.c616A6B)),
            TextSpan(
                text: 'الشروط',
                style: TextStyles.semiBold13
                    .copyWith(color: AppColors.lightPrimaryColor)),
            TextSpan(text: ' '),
            TextSpan(
              text: 'والإحكام الخاصة بنا',
              style: TextStyles.semiBold13
                  .copyWith(color: AppColors.lightPrimaryColor),
            ),
          ])),
        )
      ],
    );
  }
}
