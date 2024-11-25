import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_e_commerce_app/core/utils/app_assets.dart';
import 'package:fruits_e_commerce_app/features/auth/data/models/login_options_data_model.dart';
import 'package:meta/meta.dart';
part 'login_cubit_state.dart';

class LoginCubit extends Cubit<LoginCubitState> 
{
  LoginCubit() : super(LoginCubitInitial());

  static LoginCubit get(context) => BlocProvider.of(context);

  List<LoginOptionsDataModel> loginOptionsDataList =
   [
    LoginOptionsDataModel(
      optionName: 'تسجيل بواسطة جوجل',
       optionIcon: ImageConstants.googleIcon),
    LoginOptionsDataModel(
      optionName: 'تسجيل بواسطة أبل',
       optionIcon: ImageConstants.appleIcon),
     LoginOptionsDataModel(
      optionName: 'تسجيل بواسطة فيسبوك',
       optionIcon: ImageConstants.facebookIcon)      
   ];
}
