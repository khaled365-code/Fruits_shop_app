import 'package:fruits_e_commerce_app/core/localization/localization_cubit/localization_cubit.dart';
import 'package:fruits_e_commerce_app/core/utils/services/firebase_auth_service.dart';
import 'package:fruits_e_commerce_app/features/auth/data/repos/auth_repo_implementation.dart';
import 'package:fruits_e_commerce_app/features/auth/presentation/cubits/login_cubit/login_cubit_cubit.dart';
import 'package:fruits_e_commerce_app/features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

setUpLocator() {
  

  serviceLocator.registerLazySingleton(
    () => FirebaseAuthService(),
  );

  serviceLocator.registerLazySingleton(
    () => AuthRepoImplementation(
        firebaseAuthService: serviceLocator.get<FirebaseAuthService>()),
  );

  serviceLocator.registerFactory(
    () => SignupCubit(authRepo: serviceLocator.get<AuthRepoImplementation>()),
  );

   serviceLocator.registerFactory(
    () => LoginCubit(),
  );

  serviceLocator.registerFactory(
    () => LocalizationCubit(),
  );
}
