import 'package:app_setup/env/app_env.dart';
import 'package:app_setup/env/app_env_fields.dart';
import 'package:envied/envied.dart';

part 'prod_env.g.dart';

@Envied(name: 'Env', path: '.env.prod')
final class ProdEnv implements AppEnv, AppEnvFields {
  ProdEnv();

  @override
  @EnviedField(obfuscate: true, varName: "API_URL")
  final String apiUrl = _Env.apiUrl;
}
