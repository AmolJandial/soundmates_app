import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:soundmates_app/providers/startup_providers.dart';
import 'package:soundmates_app/common/views/error/error_screen.dart';
import 'package:soundmates_app/common/views/loading/startup_loading_screen.dart';

class AppStartupWidget extends HookConsumerWidget {
  const AppStartupWidget({super.key, required this.onLoaded});

  final WidgetBuilder onLoaded;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appStartupState = ref.watch(appStartupProvider);

    return appStartupState.when(
      loading: () => const StartupLoadingScreen(),
      data: (_) => onLoaded(context),
      error:
          (error, stackTrace) => ErrorScreen(
            onRetry: () {
              ref.invalidate(appStartupProvider);
            },
          ),
    );
  }
}
