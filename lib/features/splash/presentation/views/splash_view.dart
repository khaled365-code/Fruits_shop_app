import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/core/app_keys.dart';
import 'package:fruits_e_commerce_app/core/cache/cache_helper.dart';
import 'package:fruits_e_commerce_app/core/commons/helper_functions.dart';
import 'package:fruits_e_commerce_app/core/router/routes.dart';
import 'package:fruits_e_commerce_app/core/utils/app_assets.dart';
import 'package:fruits_e_commerce_app/core/utils/app_colors.dart';
import 'package:svg_flutter/svg.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    getDelayed();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  isArabic(context: context) == true
                      ? SvgPicture.asset(ImageConstants.treeSplash)
                      : Transform(
                          transform: Matrix4.rotationY(1.57),
                          child: SvgPicture.asset(ImageConstants.treeSplash),
                        ),
                ],
              ),
              SvgPicture.asset(
                ImageConstants.splashLogo,
              ),
              SvgPicture.asset(
                ImageConstants.pointsSplashIcon,
                fit: BoxFit.fill,
              ),
            ],
          ),
        ));
  }

  void getDelayed() 
  {                       

    Future.delayed(Duration(seconds: 10), () {
      var onboardingIsSeen= CacheHelper().getData(key: AppKeys.appOnboradingSeenDone);
     if(onboardingIsSeen==true)
      {
       navigate(context: context, route: Routes.loginScreen,replacement: true);
      }
      else
      {
         navigate(context: context, route: Routes.onBoardingScreen,replacement: true);
      }
    });
  }
}
