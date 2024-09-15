import 'package:hive/hive.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_local_repository.g.dart';

@Riverpod(keepAlive: true)
AuthLocalRepository authLocalRepository(AuthLocalRepositoryRef ref) {
  return AuthLocalRepository();
}

class AuthLocalRepository {
  static const _boxName = 'auth';

  Future<void> init() async {
    await Hive.openBox(_boxName);
  }

  void setToken(String? token) {
    final box = Hive.box(_boxName);
    if (token != null) {
      box.put("accessToken", token);
    } else {
      box.delete("accessToken");
    }
  }

  String? getToken() {
    final box = Hive.box(_boxName);
    return box.get("accessToken");
  }
}
