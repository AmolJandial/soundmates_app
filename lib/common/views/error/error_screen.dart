import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:soundmates_app/config/app_assets.dart';
import 'package:soundmates_app/config/app_colors.dart';
import 'package:soundmates_app/config/app_strings.dart';
import 'package:soundmates_app/config/extensions.dart';
import 'package:soundmates_app/providers/startup_providers.dart';

class ErrorScreen extends ConsumerWidget {
  const ErrorScreen({super.key, required this.onRetry});

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final errorState = ref.watch(errorControllerProvider);
    return Scaffold(
      body: Center(
        child: Column(
          spacing: 8,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppAssets.errorImage, width: context.screenWidth * 0.8, height: context.screenHeight * 0.5),
            Text(errorState.$1 == 0 ? AppString.unexpected : errorState.$2, style: context.textTheme.bodyLarge),
            FilledButton(
              onPressed: onRetry,
              child: Text(
                AppString.retry,
                style: context.textTheme.labelLarge!.withColor(AppColors.secondaryTextColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
