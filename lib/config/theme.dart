import 'package:flutter/material.dart';
import 'package:soundmates_app/config/app_colors.dart';
import 'package:soundmates_app/config/extensions.dart';
import 'package:soundmates_app/config/text_theme.dart';

final theme = ThemeData(
  textTheme: AppTextTheme.appTextTheme,
  scaffoldBackgroundColor: AppColors.backgroundColor,
  elevatedButtonTheme: _elevatedButtonTheme,
  filledButtonTheme: _filleldButtonTheme,
  appBarTheme: _appBarTheme,
);

final _elevatedButtonTheme = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryButton, shape: ShapeBorderX.rounded(8)),
);

final _filleldButtonTheme = FilledButtonThemeData(
  style: FilledButton.styleFrom(backgroundColor: AppColors.secondaryButton, shape: ShapeBorderX.rounded(8)),
);

final _appBarTheme = const AppBarTheme();
