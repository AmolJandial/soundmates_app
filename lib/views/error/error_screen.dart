import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:soundmates_app/config/app_colors.dart';
import 'package:soundmates_app/config/extensions.dart';

class ErrorScreen extends ConsumerWidget {
  const ErrorScreen({super.key, required this.onRetry, required this.message});

  final VoidCallback onRetry;
  final String message;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton(
              onPressed: onRetry,
              child: Text('Retry', style: context.textTheme.labelLarge!.withColor(AppColors.secondaryTextColor)),
            ),
          ],
        ),
      ),
    );
  }
}
