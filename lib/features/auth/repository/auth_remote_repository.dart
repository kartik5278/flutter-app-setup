import 'package:app_setup/core/failure/app_failure.dart';
import 'package:fpdart/fpdart.dart';

class AuthRemoteRepository {
  // Future<Either<AppFailure, dynamic>> login({
  //   required String email,
  //   required String password,
  // }) async {
  //   try {
  //     final response = await http.post(
  //       Uri.parse(
  //         '${ServerConstant.serverURL}/auth/login',
  //       ),
  //       headers: {
  //         'Content-Type': 'application/json',
  //       },
  //       body: jsonEncode(
  //         {
  //           'email': email,
  //           'password': password,
  //         },
  //       ),
  //     );
  //     final resBodyMap = jsonDecode(response.body) as Map<String, dynamic>;

  //     if (response.statusCode != 200) {
  //       return Left(AppFailure(resBodyMap['detail']));
  //     }

  //     return Right(
  //       UserModel.fromMap(resBodyMap['user']).copyWith(
  //         token: resBodyMap['token'],
  //       ),
  //     );
  //   } catch (e) {
  //     return Left(AppFailure(e.toString()));
  //   }
  // }
}
