import 'dart:convert';

import 'package:app_setup/core/failure/app_failure.dart';
import 'package:app_setup/core/models/user_model.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_remote_repository.g.dart';

@Riverpod(keepAlive: true)
AuthRemoteRepository authRemoteRepository(AuthRemoteRepositoryRef ref) {
  return AuthRemoteRepository();
}

final Map<String, dynamic> response = {
  "body": {
    "user": {
      "id": "1",
      "name": 'My Name',
      "email": 'My Email',
      "token": 'some-updated-secret-auth-token',
    },
  },
  "statusCode": 200
};

class AuthRemoteRepository {
  Future<Either<AppFailure, dynamic>> login({
    required String email,
    required String password,
  }) async {
    try {
      final resBodyMap = response["body"];

      // API CALL
      final result = await Future.delayed(
        const Duration(seconds: 2),
        () => resBodyMap,
      );
      print("res===>$result ${response["statusCode"]}");

      if (response["statusCode"] != 200) {
        return Left(AppFailure(resBodyMap['detail']));
      }

      return Right(
        UserModel.fromMap(result['user']),
      );
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }
}
