import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_e_commerce_app/core/utils/app_assets.dart';
import 'package:fruits_e_commerce_app/features/auth/data/models/login_options_data_model.dart';
import 'package:fruits_e_commerce_app/features/auth/domain/entities/user_entity.dart';
import 'package:fruits_e_commerce_app/features/auth/domain/repos/auth_repo.dart';
part 'login_cubit_state.dart';

class LoginCubit extends Cubit<LoginCubitState> {
  LoginCubit({required this.authRepo}) : super(LoginCubitInitial());

  final AuthRepo authRepo;

  static LoginCubit get(context) => BlocProvider.of(context);

  List<LoginOptionsDataModel> loginOptionsDataList = [
    LoginOptionsDataModel(
        optionName: 'تسجيل بواسطة جوجل', optionIcon: ImageConstants.googleIcon),
    LoginOptionsDataModel(
        optionName: 'تسجيل بواسطة أبل', optionIcon: ImageConstants.appleIcon),
    LoginOptionsDataModel(
        optionName: 'تسجيل بواسطة فيسبوك',
        optionIcon: ImageConstants.facebookIcon)
  ];

  TextEditingController emialController = TextEditingController();
  TextEditingController passController = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey();
  AutovalidateMode loginFormValidateMode = AutovalidateMode.disabled;
  IconData loginPassEye = Icons.visibility_off;
  bool loginPassSecureText = true;

  changePassEyeShape() {
    if (loginPassEye == Icons.visibility_off) {
      loginPassEye = Icons.visibility;
      loginPassSecureText = false;
    } else {
      loginPassEye = Icons.visibility_off;
      loginPassSecureText = true;
    }
    emit(ChangePassEyeShapeState());
  }

  changeLoginFormValidateMode() {
    loginFormValidateMode = AutovalidateMode.always;
    emit(ChangeLoginFormValidateModeState());
  }

  loginWithEmailAndPasswordFun(
      {required String email, required String password}) async {
    emit(LoginLoadingState());
    final result = await authRepo.loginWithEmailAndPassword(
        email: email, password: password);

    result.fold(
      (Failure) => emit(LoginFailureState(message: Failure.message)),
      (user) => emit(LoginSuccessState(userEntity: user)),
    );
  }

  void onLoginPressedAction(BuildContext context) 
  {
     if (loginFormKey.currentState!.validate())
      {
     loginFormKey.currentState!.save();
      loginWithEmailAndPasswordFun(
        email: LoginCubit.get(context) .emialController .text,
        password: LoginCubit.get(context) .passController .text,
      );
    } else 
    {
      changeLoginFormValidateMode();
    }
  }
}
