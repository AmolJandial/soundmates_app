import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:soundmates_app/app_startup.dart';
import 'package:soundmates_app/config/theme.dart';
import 'package:soundmates_app/providers/router_provider.dart';

void main() {
  runApp(const ProviderScope(child: RootAppWidget()));
}

class RootAppWidget extends ConsumerWidget {
  const RootAppWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final beamer = ref.watch(routerProvider);
    return MaterialApp.router(
      theme: theme,
      routeInformationParser: BeamerParser(),
      routerDelegate: beamer,
      backButtonDispatcher: BeamerBackButtonDispatcher(delegate: beamer),
      builder: (_, child) => AppStartupWidget(onLoaded: (_) => child!),
    );
  }
}
