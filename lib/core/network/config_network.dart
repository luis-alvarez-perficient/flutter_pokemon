import 'package:flutter_pokemon/core/util/constant/api.dart';
import 'package:injectable/injectable.dart';

abstract class IConfig {
  String get baseUrl;

  Map<String, String> get headers;
}

@Injectable(as: IConfig)
class AppConfig extends IConfig {
  @override
  String get baseUrl => Api.baseUrlPokemon;

  @override
  Map<String, String> get headers => {};
}
