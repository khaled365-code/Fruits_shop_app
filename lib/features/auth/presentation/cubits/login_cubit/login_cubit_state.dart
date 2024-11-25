part of 'login_cubit_cubit.dart';

@immutable
sealed class LoginCubitState {}

final class LoginCubitInitial extends LoginCubitState {}

final class LoginLoadingState extends LoginCubitState {}

final class LoginFailureState extends LoginCubitState {
  final String message;
  LoginFailureState({required this.message});
}

final class LoginSuccessState extends LoginCubitState {
  final UserEntity userEntity;
  LoginSuccessState({required this.userEntity});
}

final class ChangePassEyeShapeState extends LoginCubitState {}

final class ChangeLoginFormValidateModeState extends LoginCubitState {}
