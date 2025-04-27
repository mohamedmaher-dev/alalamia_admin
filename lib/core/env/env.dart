// ignore_for_file: avoid_classes_with_only_static_members

import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(useConstantCase: true, obfuscate: true)
abstract class Env {
  @EnviedField()
  static String apiBaseUrl = _Env.apiBaseUrl;
}
