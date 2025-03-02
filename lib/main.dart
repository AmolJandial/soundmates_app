import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:soundmates_app/app_startup.dart';
import 'package:soundmates_app/config/theme.dart';
import 'package:soundmates_app/providers/startup_providers.dart';

void main() {
  runApp(const ProviderScope(child: RootAppWidget()));
}

class RootAppWidget extends ConsumerWidget {
  const RootAppWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      theme: theme,
      routerConfig: ref.watch(autoRouteProvider).config(),
      builder: (_, child) => AppStartupWidget(onLoaded: (_) => child!),
    );
  }
}
