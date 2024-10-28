import 'package:fruits_e_commerce_app/core/localization/localization_cubit/localization_cubit.dart';
import 'package:fruits_e_commerce_app/features/auth/presentation/cubits/login_cubit/cubit/login_cubit_cubit.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

setUpLocator() {
  serviceLocator.registerFactory(
    () => LocalizationCubit(),
  );

  serviceLocator.registerFactory(
    () => LoginCubit(),
  );
}
