import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:soundmates_app/app_router.dart';

///*async loads env file into dotEnv package
final envFileProvider = FutureProvider<void>((ref) async {
  // await Future.delayed(const Duration(seconds: 10));
  log('envFileProvider build');

  throw Exception();
  return await dotenv.load(fileName: '.env');
});

///*loads router provider
final autoRouteProvider = Provider<AppRouter>((ref) {
  log('autoRouteProvider build');

  return AppRouter();
});

///*intitializes all async providers at app startup, keeping their state even if not listened to
final appStartupProvider = FutureProvider.autoDispose<void>((ref) async {
  ref.onDispose(() {
    log('appStartupProvider dispose');

    ref.invalidate(envFileProvider);
  });
  log('appStartupProvider build');
  await ref.watch(envFileProvider.future);
  ref.keepAlive();
});
