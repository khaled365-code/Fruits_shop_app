part of 'localization_cubit.dart';

@immutable
sealed class LocalizationState {}

final class LocalizationInitial extends LocalizationState {}
final class ChangeLanToEnglishState extends LocalizationState {}
final class ChangeLanToArabicState extends LocalizationState {}


