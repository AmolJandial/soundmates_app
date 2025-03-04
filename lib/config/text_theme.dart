import 'package:flutter/material.dart';
import 'package:soundmates_app/config/app_colors.dart';

class AppTextTheme {
  const AppTextTheme._();

  static final appTextTheme = const TextTheme(
    labelLarge: TextStyle(color: AppColors.primaryTextColor),
    bodyLarge: TextStyle(color: AppColors.primaryTextColor),
  );
}
