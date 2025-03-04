import 'package:flutter/material.dart';
import 'package:soundmates_app/config/app_colors.dart';

class AppTextTheme {
  const AppTextTheme._();

  static final appTextTheme = const TextTheme(
    labelLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: AppColors.primaryTextColor),
    bodyLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: AppColors.primaryTextColor),
  );
}
