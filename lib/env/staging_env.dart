import 'package:app_setup/env/app_env.dart';
import 'package:app_setup/env/app_env_fields.dart';
import 'package:envied/envied.dart';

part 'staging_env.g.dart';

@Envied(name: 'Env', path: '.env.staging')
final class StagingEnv implements AppEnv, AppEnvFields {
  StagingEnv();

  @override
  @EnviedField(obfuscate: true, varName: "API_URL")
  final String apiUrl = _Env.apiUrl;
}
