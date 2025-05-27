import 'package:nba_sdk/core/network/api_result.dart';

abstract class ApiClient {
  Future<ApiResult<T>> get<T>(String path, {Map<String, dynamic>? queryParameters});
  Future<ApiResult<T>> post<T>(String path, {Map<String, dynamic>? body, Map<String, dynamic>? queryParameters});
  Future<ApiResult<T>> put<T>(String path, {Map<String, dynamic>? body, Map<String, dynamic>? queryParameters});
  Future<ApiResult<T>> delete<T>(String path, {Map<String, dynamic>? queryParameters});
}

