import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:fruits_e_commerce_app/fruits_app.dart';

void main() 
{
  //cpmment
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  Future.delayed(const Duration(seconds: 3), () {

  });
  FlutterNativeSplash.remove();
  runApp(const FruitsApp());
}
