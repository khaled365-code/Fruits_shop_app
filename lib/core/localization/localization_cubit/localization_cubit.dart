import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_e_commerce_app/core/app_keys.dart';
import 'package:fruits_e_commerce_app/core/cache/cache_helper.dart';
import 'package:meta/meta.dart';
part 'localization_state.dart';

class LocalizationCubit extends Cubit<LocalizationState> {
  LocalizationCubit() : super(LocalizationInitial());

  static LocalizationCubit get(context) => BlocProvider.of(context);

  String currentLanguage = 'ar';

  changeToEnglish() async {
    if (currentLanguage == 'en') {
      return;
    }
    currentLanguage = 'en';
    await CacheHelper().saveData(key: AppKeys.appCurrentLanguage, value: 'en');
    emit(ChangeLanToEnglishState());
  }

  changeToArabic() async {
    if (currentLanguage == 'ar') {
      return;
    }
    currentLanguage = 'ar';
    await CacheHelper().saveData(key: AppKeys.appCurrentLanguage, value: 'ar');
    emit(ChangeLanToArabicState());
  }
}
