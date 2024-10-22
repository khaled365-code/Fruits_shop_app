import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/core/commons/helper_functions.dart';
import 'package:fruits_e_commerce_app/core/router/routes.dart';
import 'package:fruits_e_commerce_app/core/utils/app_assets.dart';
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
        body: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset(ImageConstants.treeSplash),
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

  void getDelayed() {
    Future.delayed(Duration(seconds: 10), () {
      navigate(context: context, route: Routes.onBoardingScreen);
    });
  }
}
