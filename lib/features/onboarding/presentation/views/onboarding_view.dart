import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/core/utils/app_assets.dart';
import 'package:fruits_e_commerce_app/core/widgets/shared_button.dart';
import 'package:fruits_e_commerce_app/features/onboarding/data/models/onbarding_data_model.dart';
import 'package:fruits_e_commerce_app/features/onboarding/presentation/widgets/dot_containers_row.dart';
import 'package:fruits_e_commerce_app/features/onboarding/presentation/widgets/page_view_section.dart';

class OnboardingView extends StatefulWidget 
{
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
  void dispose() 
  {
    pageViewController.dispose();
    super.dispose();
  }

  List<OnboardingDataModel> onboardingDataList = [
    OnboardingDataModel(
        backImage: ImageConstants.bananaBackImage,
        mainImage: ImageConstants.fruitsDishImage,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
           children: 
           [
          Text(' مرحبًا بك في '),
          Text('HUB'),
          Text('Fruit'),
        ]),
        subTitle: 'اكتشف تجربة تسوق فريدة مع FruitHUB.\n'
            'استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة\n'
            'واحصل على أفضل العروض والجودة العالية'),
    OnboardingDataModel(
        backImage: ImageConstants.ananasBackgroundImage,
        mainImage: ImageConstants.ananasImage,
        title: Text('ابحث وتسوق'),
        subTitle: 'نقدم لك أفضل الفواكه المختارة بعناية طلع على.\n'
            'التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة\n'
            'المثالية.'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            PageViewSection(
              currentPage: currentPage,
              onboardingDataList: onboardingDataList,
              pageViewController: pageViewController,
            ),
            SizedBox(height: 64),
            DotContainersRow(
              currentPage: currentPage,
            ),
            SizedBox(height: currentPage == 0 ? 125.5 : 29),
            currentPage == 0
                ? SizedBox.shrink()
                : SharedButton(onButtonPressed: () {}, buttonText: 'ابدأ الان'),
            currentPage == 1
                ? SizedBox(
                    height: 43,
                  )
                : SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
