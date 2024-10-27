import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_e_commerce_app/core/app_keys.dart';
import 'package:fruits_e_commerce_app/core/cache/cache_helper.dart';
import 'package:fruits_e_commerce_app/core/injection/injector.dart';
import 'package:fruits_e_commerce_app/core/localization/app_localization.dart';
import 'package:fruits_e_commerce_app/core/localization/localization_cubit/localization_cubit.dart';
import 'package:fruits_e_commerce_app/core/router/app_router.dart';
import 'package:fruits_e_commerce_app/core/router/routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class FruitsApp extends StatelessWidget {
  const FruitsApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator<LocalizationCubit>(),
      child: BlocBuilder<LocalizationCubit, LocalizationState>(
        builder: (context, state) {
          return MaterialApp(
            theme: ThemeData(
              fontFamily: 'Cairo',
            ),
            localizationsDelegates: const [
              AppLocalizationDelegate(),
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: AppLocalization.supportedLocales,
            localeResolutionCallback: (deviceLocale, supportedLocales) {
              for (var locale in supportedLocales) {
                if (deviceLocale != null &&
                    deviceLocale.languageCode == locale.languageCode) {
                  return deviceLocale;
                }
              }
              return supportedLocales.first;
            },
            locale: Locale(
                CacheHelper().getData(key: AppKeys.appCurrentLanguage) == null
                    ? LocalizationCubit.get(context).currentLanguage
                    : CacheHelper().getData(key: AppKeys.appCurrentLanguage)),
            debugShowCheckedModeBanner: false,
            initialRoute: Routes.splashScreen,
            onGenerateRoute: AppRouter.onGenerateRoutes,
          );
        },
      ),
    );
  }
}
