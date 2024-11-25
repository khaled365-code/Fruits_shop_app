import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_e_commerce_app/features/auth/domain/entities/user_entity.dart';
import 'package:fruits_e_commerce_app/features/auth/domain/repos/auth_repo.dart';
part 'signup_state.dart';


class SignupCubit extends Cubit<SignupState> 
{
  SignupCubit({required this.authRepo}) : super(SignupInitial());

  final AuthRepo authRepo;

  static SignupCubit get(context) => BlocProvider.of(context);

  TextEditingController signupNameController = TextEditingController();
  TextEditingController signupEmailController = TextEditingController();
  TextEditingController signupPasswordController = TextEditingController();

  GlobalKey<FormState> signupFormKey = GlobalKey();

  AutovalidateMode signupValidateMode = AutovalidateMode.disabled;

  bool termsAndConditionsIsChecked = false;

  changeTermsAndConditionsValue()
  {
    termsAndConditionsIsChecked = !termsAndConditionsIsChecked;
    emit(termsAndConditionsChangedState());
  }

  changeSignUpValidateMode() {
    signupValidateMode = AutovalidateMode.always;
    emit(SignupValidateModeActivatedState());
  }

  IconData passwordIcon = Icons.visibility_off;
  bool passwordObsecureText = true;

  changePasswordEyeShape() {
    if (passwordIcon == Icons.visibility_off) {
      passwordIcon = Icons.visibility;
      passwordObsecureText = false;
    } else {
      passwordIcon = Icons.visibility_off;
      passwordObsecureText = true;
    }
    emit(passwordEyeShapeChangedState());
  }

  createUserWithEmail(
      {required String email,
      required String password,
      required String name}) async {
    emit(SignupLoadingState());
    final result = await authRepo.createUserWithEmailAndPassword(
        email: email, password: password, name: name);

    result.fold(
      (failure) {
        emit(SignupFailureState(message: failure.message));
      },
      (user) {
        emit(SignupSuccessState(userEntity: user));
      },
    );
  }
}
