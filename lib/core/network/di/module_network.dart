import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class ModuleNetwork {
  @preResolve
  Future<Dio> get dio async {
    final dio = Dio();
    dio.options.baseUrl = 'https://pokeapi.co/api/v2/';
    dio.options.connectTimeout = const Duration(seconds: 30);
    dio.options.receiveTimeout = const Duration(seconds: 30);
    return dio;
  }
}
