import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'AI_API_KEY', obfuscate: true)
  static String aiApiKey = _Env.aiApiKey;
}
