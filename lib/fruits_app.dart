import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/core/router/app_router.dart';
import 'package:fruits_e_commerce_app/core/router/routes.dart';

class FruitsApp extends StatelessWidget {
  const FruitsApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splashScreen,
      onGenerateRoute: AppRouter.onGenerateRoutes,
    );
  }
}
