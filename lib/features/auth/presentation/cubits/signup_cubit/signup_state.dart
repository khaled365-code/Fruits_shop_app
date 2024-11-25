part of 'signup_cubit.dart';

@immutable
sealed class SignupState {}

final class SignupInitial extends SignupState {}

final class termsAndConditionsChangedState extends SignupState {}

final class passwordEyeShapeChangedState extends SignupState {}

final class SignupValidateModeActivatedState extends SignupState {}


final class SignupLoadingState extends SignupState {}

final class SignupSuccessState extends SignupState {
  final UserEntity userEntity;

  SignupSuccessState({required this.userEntity});
}

final class SignupFailureState extends SignupState {
  final String message;

  SignupFailureState({required this.message});
}
