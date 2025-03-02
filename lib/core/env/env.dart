import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(useConstantCase: true, obfuscate: true)
abstract class Env {
  @EnviedField()
  static String apiAuthBaseUrl = _Env.apiAuthBaseUrl;

  @EnviedField()
  static String apiOrdersBaseUrl = _Env.apiOrdersBaseUrl;
}
