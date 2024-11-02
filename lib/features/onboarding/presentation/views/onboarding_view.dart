import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/core/app_keys.dart';
import 'package:fruits_e_commerce_app/core/cache/cache_helper.dart';
import 'package:fruits_e_commerce_app/core/commons/helper_functions.dart';
import 'package:fruits_e_commerce_app/core/router/routes.dart';
import 'package:fruits_e_commerce_app/core/utils/app_assets.dart';
import 'package:fruits_e_commerce_app/core/utils/app_colors.dart';
import 'package:fruits_e_commerce_app/core/utils/text_styles.dart';
import 'package:fruits_e_commerce_app/core/widgets/shared_button.dart';
import 'package:fruits_e_commerce_app/core/widgets/space_widget.dart';
import 'package:fruits_e_commerce_app/features/onboarding/data/models/onbarding_data_model.dart';
import 'package:fruits_e_commerce_app/features/onboarding/presentation/widgets/dot_containers_row.dart';
import 'package:fruits_e_commerce_app/features/onboarding/presentation/widgets/page_view_section.dart';

class OnboardingView extends StatefulWidget {
  OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  late PageController pageViewController;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    pageViewController = PageController();
    pageViewController.addListener(
      () {
        setState(() {
          currentPage = pageViewController.page!.round();
        });
      },
    );
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  List<OnboardingDataModel> onboardingDataList = [
    OnboardingDataModel(
        backImage: ImageConstants.bananaBackImage,
        mainImage: ImageConstants.fruitsDishImage,
        title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            ' مرحبًا بك في ',
            style: TextStyles.bold23.copyWith(color: AppColors.c0C0D0D),
          ),
          Text(
            'HUB',
            style: TextStyles.bold23.copyWith(color: AppColors.secondaryColor),
          ),
          Text(
            'Fruit',
            style: TextStyles.bold23.copyWith(color: AppColors.primaryColor),
          ),
        ]),
        subTitle: 'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف\n'
            'مجموعتنا الواسعة من الفواكه الطازجة الممتازة\n'
            'واحصل على أفضل العروض والجودة العالية'),
    OnboardingDataModel(
        backImage: ImageConstants.ananasBackgroundImage,
        mainImage: ImageConstants.ananasImage,
        title: Text(
          'ابحث وتسوق',
          style: TextStyles.bold23.copyWith(color: AppColors.c0C0D0D),
        ),
        subTitle: 'نقدم لك أفضل الفواكه المختارة بعناية. طلع على\n'
            'التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة\n'
            'المثالية'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            PageViewSection(
              currentPage: currentPage,
              onboardingDataList: onboardingDataList,
              pageViewController: pageViewController,
            ),
            SpaceWidget(height: 64),
            DotContainersRow(
              currentPage: currentPage,
            ),
            currentPage == 0
                ? SpaceWidget(
                    height: 125.5,
                  )
                : SpaceWidget(
                    height: 29,
                  ),
            currentPage == 0
                ? SizedBox.shrink()
                : SharedButton(
                    onButtonPressed: () async 
                    {
                      await CacheHelper().saveData(
                          key: AppKeys.appOnboradingSeenDone, value: true);
                      navigate(
                          context: context,
                          route: Routes.loginScreen,
                          replacement: true);
                    },
                    buttonText: 'ابدأ الان'),
            currentPage == 1
                ? SpaceWidget(
                    height: 43,
                  )
                : SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
