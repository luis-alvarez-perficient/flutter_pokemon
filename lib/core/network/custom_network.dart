import 'package:flutter_pokemon/core/network/dio_http_client.dart';

abstract class CustomNetwork {
  Future<dynamic> get(String url, {Map<String, dynamic>? queryParameters});

  Future<dynamic> post(
    String url, {
    Map<String, dynamic>? queryParameters,
    dynamic body,
  });

  Future<dynamic> put(
    String url, {
    Map<String, dynamic>? queryParameters,
    dynamic body,
  });

  Future<dynamic> delete(
    String url, {
    Map<String, dynamic>? queryParameters,
    dynamic body,
  });

  Future<dynamic> patch(
    String url, {
    Map<String, dynamic>? queryParameters,
    dynamic body,
  });
}

class CustomNetworkImpl implements CustomNetwork {
  final DioHttpClient client;

  CustomNetworkImpl({required this.client});

  @override
  Future<dynamic> get(
    String url, {
    Map<String, dynamic>? queryParameters,
  }) async {
    return await client.get(url, queryParameters: queryParameters);
  }

  @override
  Future<dynamic> post(
    String url, {
    Map<String, dynamic>? queryParameters,
    dynamic body,
  }) async {
    return await client.post(url, queryParameters: queryParameters, body: body);
  }

  @override
  Future<dynamic> put(
    String url, {
    Map<String, dynamic>? queryParameters,
    dynamic body,
  }) async {
    return await client.put(url, queryParameters: queryParameters, body: body);
  }

  @override
  Future<dynamic> delete(
    String url, {
    Map<String, dynamic>? queryParameters,
    dynamic body,
  }) async {
    return await client.delete(
      url,
      queryParameters: queryParameters,
      body: body,
    );
  }

  @override
  Future<dynamic> patch(
    String url, {
    Map<String, dynamic>? queryParameters,
    dynamic body,
  }) async {
    return await client.patch(
      url,
      queryParameters: queryParameters,
      body: body,
    );
  }
}
