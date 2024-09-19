import 'dart:convert';

import 'package:app_setup/core/failure/app_failure.dart';
import 'package:app_setup/core/models/user_model.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_remote_repository.g.dart';

@riverpod
AuthRemoteRepository authRemoteRepository(AuthRemoteRepositoryRef ref) {
  return AuthRemoteRepository();
}

final Map<String, dynamic> response = {
  "body": {
    "user": {
      "id": -1,
      "displayName": 'My Name',
      "email": 'My Email',
    },
    "token": 'some-updated-secret-auth-token',
  },
  "statusCode": 200
};

class AuthRemoteRepository {
  Future<Either<AppFailure, dynamic>> login({
    required String email,
    required String password,
  }) async {
    try {
      final resBodyMap = jsonDecode(response["body"]) as Map<String, dynamic>;

      // API CALL
      final result = await Future.delayed(
        const Duration(seconds: 2),
        () => resBodyMap,
      );

      if (result["statusCode"] != 200) {
        return Left(AppFailure(resBodyMap['detail']));
      }

      return Right(
        UserModel.fromMap(result['user']).copyWith(
          token: result['token'],
        ),
      );
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }
}
