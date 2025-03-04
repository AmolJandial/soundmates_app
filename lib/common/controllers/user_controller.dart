import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:soundmates_app/config/enums/user_status.dart';
import 'package:soundmates_app/common/models/user.dart';
import 'package:soundmates_app/providers/startup_providers.dart';
import 'package:soundmates_app/common/services/database.dart';
import 'package:soundmates_app/common/services/shared_preference_service.dart';

class UserState extends Equatable {
  final User? user;
  final UserStatus status;

  const UserState({required this.user, required this.status});

  @override
  List<Object?> get props => [user, status];

  UserState copyWith({User? user, UserStatus? status}) {
    return UserState(user: user ?? this.user, status: status ?? this.status);
  }
}

class UserController extends AsyncNotifier<UserState> {
  @override
  FutureOr<UserState> build() async {
    log('user controller build');
    ref.onDispose(() {
      log('user controller dispose');
    });

    ///*get AT from pref, if null new user, if there then send database request
    final token = _getToken();
    if (token.isEmpty) {
      log('no access token in pref');
      return const UserState(user: null, status: UserStatus.unauthorized);
    }
    final user = await _getUser(token);
    if (null == user) {
      log('user is unauthorized, so setting state to unauth');
      return const UserState(user: null, status: UserStatus.unauthorized);
    }
    log('user is authorized, so setting state to auth');

    return UserState(user: user, status: UserStatus.authorized);
  }

  late final Database _database;
  late final SharedPreferenceService _sharedPreferenceService;

  String _getToken() {
    _sharedPreferenceService = ref.watch(sharedPreferenceServiceProvider);
    final token = _sharedPreferenceService.getString(dotenv.get('ACCESS_TOKEN_KEY')) ?? '';
    return token;
  }

  Future<User?> _getUser(String token) async {
    _database = ref.watch(databaseServiceProvider);
    final user = await _database.getUser(token);
    user.fold(
      (failure) {
        if (failure.code == 401) {
          return null;
        }
        return null;
      },
      (user) {
        return user!;
      },
    );
    return null;
  }
}
