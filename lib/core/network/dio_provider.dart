import 'package:dio/dio.dart';
import 'package:flutter_pokemon/core/network/config_network.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DioProvider {
  @singleton
  Dio dio(IConfig config) {
    Dio dio = Dio();
    dio.options.headers = config.headers;
    dio.options.baseUrl = config.baseUrl;
    return dio;
  }
}
