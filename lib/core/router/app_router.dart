import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/core/router/routes.dart';
import 'package:fruits_e_commerce_app/features/auth/presentation/views/login_view.dart';
import 'package:fruits_e_commerce_app/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:fruits_e_commerce_app/features/splash/presentation/views/splash_view.dart';

class AppRouter {
  static Route? onGenerateRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(
          builder: (context) => SplashView(),
        );

      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (context) => OnboardingView(),
        );

      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (context) => LoginView(),
        );      

      default:
        return MaterialPageRoute(
          builder: (context) => 
          Scaffold(
            body: Center(
              child: Text('No route found'),
            ),
          ),
        );
    }
  }
}
