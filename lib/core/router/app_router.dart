import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_e_commerce_app/core/injection/injector.dart';
import 'package:fruits_e_commerce_app/core/router/routes.dart';
import 'package:fruits_e_commerce_app/features/auth/presentation/cubits/login_cubit/cubit/login_cubit_cubit.dart';
import 'package:fruits_e_commerce_app/features/auth/presentation/views/login_view.dart';
import 'package:fruits_e_commerce_app/features/auth/presentation/views/signup_view.dart';
import 'package:fruits_e_commerce_app/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:fruits_e_commerce_app/features/splash/presentation/views/splash_view.dart';

class AppRouter 
{
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
          builder: (context) => BlocProvider(
            create: (context) => serviceLocator<LoginCubit>(),
            child: LoginView(),
          ),
        );

      case Routes.signuScreen:
        return MaterialPageRoute(
          builder: (context) => SignupView(),
        );  

      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text('No route found'),
            ),
          ),
        );
    }
  }
}
