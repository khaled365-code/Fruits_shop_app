import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:fruits_e_commerce_app/core/bloc_observer.dart';
import 'package:fruits_e_commerce_app/core/cache/cache_helper.dart';
import 'package:fruits_e_commerce_app/core/injection/injector.dart';
import 'package:fruits_e_commerce_app/fruits_app.dart';

void main() async
 {
  //comment
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Future.wait([
    CacheHelper.init(),
  ]);
  setUpLocator();
  FlutterNativeSplash.remove();
  runApp(const FruitsApp());
  Bloc.observer = MyBlocObserver();
}
