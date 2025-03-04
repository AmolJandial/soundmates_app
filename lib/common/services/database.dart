import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fpdart/fpdart.dart';
import 'package:soundmates_app/common/models/failure.dart';
import 'package:soundmates_app/common/models/user.dart';
import 'package:soundmates_app/config/app_strings.dart';

class Database {
  final Dio dio;

  const Database({required this.dio});

  Future<Either<Failure, User?>> getUser(String token) async {
    try {
      log('getting user');
      final serverUrl = dotenv.get('LOCAL_SERVER_URL');
      final options = token == '' ? null : Options(headers: {'authorization': token});
      final response = await dio.get('$serverUrl/api/v1/user', options: options);
      return const Right(null);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.badResponse) {
        log('unauthorized user');
        return const Left(Failure(code: 401, message: 'Unauthorized user'));
      }
      return const Left(Failure(code: 500, message: AppString.unexpected));
    } catch (e) {
      log('error -> $e');
      return const Left(Failure(code: 500, message: AppString.unexpected));
    }
  }
}
