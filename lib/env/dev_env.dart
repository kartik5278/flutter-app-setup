import 'package:app_setup/env/app_env.dart';
import 'package:app_setup/env/app_env_fields.dart';
import 'package:envied/envied.dart';

part 'dev_env.g.dart';

@Envied(name: 'Env', path: '.env.dev')
final class DevEnv implements AppEnv, AppEnvFields {
  DevEnv();

  @override
  @EnviedField(varName: "API_URL")
  final String apiUrl = _Env.apiUrl;
}
