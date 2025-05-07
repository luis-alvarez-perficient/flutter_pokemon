import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

abstract class DioHttpClient {
  @factoryMethod
  Future<dynamic> get(String url, {Map<String, dynamic>? queryParameters});

  @factoryMethod
  Future<dynamic> post(
    String url, {
    Map<String, dynamic>? queryParameters,
    dynamic body,
  });

  @factoryMethod
  Future<dynamic> put(
    String url, {
    Map<String, dynamic>? queryParameters,
    dynamic body,
  });

  @factoryMethod
  Future<dynamic> delete(
    String url, {
    Map<String, dynamic>? queryParameters,
    dynamic body,
  });

  @factoryMethod
  Future<dynamic> patch(
    String url, {
    Map<String, dynamic>? queryParameters,
    dynamic body,
  });
}

@Injectable(as: DioHttpClient)
class DioHttpClientImpl implements DioHttpClient {
  final Dio dio;
  DioHttpClientImpl({required this.dio});

  @override
  Future<dynamic> get(
    String url, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await dio.get(url, queryParameters: queryParameters);
      return response.data;
    } on DioException catch (_) {
      rethrow;
    }
  }

  @override
  Future<dynamic> post(
    String url, {
    Map<String, dynamic>? queryParameters,
    dynamic body,
  }) async {
    try {
      final response = await dio.post(
        url,
        queryParameters: queryParameters,
        data: body,
      );
      return response.data;
    } on DioException catch (_) {
      rethrow;
    }
  }

  @override
  Future<dynamic> put(
    String url, {
    Map<String, dynamic>? queryParameters,
    dynamic body,
  }) async {
    try {
      final response = await dio.put(
        url,
        queryParameters: queryParameters,
        data: body,
      );
      return response.data;
    } on DioException catch (_) {
      rethrow;
    }
  }

  @override
  Future<dynamic> delete(
    String url, {
    Map<String, dynamic>? queryParameters,
    dynamic body,
  }) async {
    try {
      final response = await dio.delete(
        url,
        queryParameters: queryParameters,
        data: body,
      );
      return response.data;
    } on DioException catch (_) {
      rethrow;
    }
  }

  @override
  Future<dynamic> patch(
    String url, {
    Map<String, dynamic>? queryParameters,
    dynamic body,
  }) async {
    try {
      final response = await dio.patch(
        url,
        queryParameters: queryParameters,
        data: body,
      );
      return response.data;
    } on DioException catch (_) {
      rethrow;
    }
  }
}
