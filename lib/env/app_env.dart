import 'package:app_setup/env/app_env_fields.dart';
import 'package:app_setup/env/dev_env.dart';
import 'package:app_setup/env/prod_env.dart';
import 'package:app_setup/env/staging_env.dart';

abstract class AppEnv implements AppEnvFields {
  static const String? appFlavor =
      String.fromEnvironment("FLUTTER_APP_FLAVOR") != ""
          ? String.fromEnvironment("FLUTTER_APP_FLAVOR")
          : null;

  factory AppEnv() => _instance;

  static final AppEnv _instance = appFlavor == 'dev'
      ? DevEnv()
      : appFlavor == 'staging'
          ? StagingEnv()
          : appFlavor == 'prod'
              ? ProdEnv()
              : DevEnv(); // throw Exception('Invalid app flavor');
}
