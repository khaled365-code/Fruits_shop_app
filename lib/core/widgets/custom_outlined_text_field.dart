import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_e_commerce_app/core/utils/app_colors.dart';
import 'package:fruits_e_commerce_app/core/utils/text_styles.dart';

class CustomOutlinedTextField extends StatelessWidget {
  const CustomOutlinedTextField(
      {super.key,
      this.prefixIcon,
      this.suffixcon,
      this.obsecureText,
      required this.controller,
      this.cursorColor,
      this.textInputFormatter,
      this.minLines,
      this.maxLines,
      this.MaxLength,
      this.keyboardType,
      this.textInputAction,
      this.contentPadding,
      this.hintText,
      this.hintStyle,
      this.inputStyle,
      this.validator,
      this.onFieldSubmitted});

  final Widget? prefixIcon;
  final Widget? suffixcon;
  final bool? obsecureText;
  final TextEditingController controller;
  final Color? cursorColor;
  final List<TextInputFormatter>? textInputFormatter;
  final int? minLines, maxLines, MaxLength;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final EdgeInsetsGeometry? contentPadding;
  final String? hintText;
  final TextStyle? hintStyle, inputStyle;
  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obsecureText ?? false,
      controller: controller,
      cursorColor: cursorColor ?? AppColors.primaryColor,
      inputFormatters: textInputFormatter,
      minLines: minLines,
      maxLines: maxLines,
      maxLength: MaxLength,
      textInputAction: textInputAction,
      keyboardType: keyboardType ?? TextInputType.text,
      validator: validator,
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
          hintText: hintText ?? '',
          hintStyle: hintStyle ??
              TextStyles.bold13.copyWith(
                color: AppColors.c949D9E,
              ),
          prefixIcon: prefixIcon,
          suffixIcon: suffixcon,
          filled: true,
          fillColor: AppColors.cF9FAFA,
          enabledBorder: _buildOutlinedBorder(),
          focusedBorder: _buildOutlinedBorder(),
          errorBorder: _buildOutlinedBorder(),
          contentPadding: contentPadding ??
              EdgeInsetsDirectional.only(start: 20.w, top: 15.h, bottom: 17.h)),
    );
  }

  OutlineInputBorder _buildOutlinedBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4.r),
      borderSide: BorderSide(color: AppColors.cE6E9EA, width: 1.w),
    );
  }
}
