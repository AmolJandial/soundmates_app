import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:soundmates_app/common/controllers/error_controller.dart';
import 'package:soundmates_app/common/controllers/user_controller.dart';
import 'package:soundmates_app/common/services/database.dart';
import 'package:soundmates_app/common/services/shared_preference_service.dart';

///*async loads env file into dotEnv package
final envFileProvider = FutureProvider<void>((ref) async {
  // await Future.delayed(const Duration(seconds: 10));
  log('envFileProvider build');
  ref.onDispose(() {
    log('envFle dispose');
  });

  return await dotenv.load(fileName: '.env');
});

///*loads global error provider
final errorControllerProvider = AutoDisposeNotifierProvider<ErrorController, (int statusCode, String message)>(
  ErrorController.new,
);

///*dio provider
final dioProvider = Provider<Dio>((ref) {
  log('dioProvider build');
  ref.onDispose(() {
    log('dioProvider dispose');
  });

  final dio = Dio();
  return dio;
});

///*database provider
final databaseServiceProvider = Provider((ref) {
  log('databaseService build');
  ref.onDispose(() {
    log('databaseService dispose');
  });

  final dio = ref.watch(dioProvider);
  return Database(dio: dio);
});

///*user controller provider
final userControllerProvider = AsyncNotifierProvider<UserController, UserState>(() {
  return UserController();
});

///*shared pref provider
final sharedPreferenceProvider = FutureProvider<SharedPreferences>((ref) async {
  log('shared pref build');
  ref.onDispose(() {
    log('shared pref dispose');
  });
  final pref = await SharedPreferences.getInstance();
  return pref;
});

final sharedPreferenceServiceProvider = Provider((ref) {
  log('shared pref service build');
  ref.onDispose(() {
    log('shared pref service dispose');
  });
  final pref = ref.watch(sharedPreferenceProvider).requireValue;
  return SharedPreferenceService(sharedPref: pref);
});

///*intitializes all async providers at app startup, keeping their state even if not listened to
final appStartupProvider = FutureProvider.autoDispose<void>((ref) async {
  ref.onDispose(() {
    log('appStartupProvider dispose');

    ref.invalidate(envFileProvider);
    ref.invalidate(userControllerProvider);
  });

  log('appStartupProvider build');
  await ref.watch(envFileProvider.future);
  await ref.watch(sharedPreferenceProvider.future);
  await ref.watch(userControllerProvider.future);
  ref.keepAlive();
});
