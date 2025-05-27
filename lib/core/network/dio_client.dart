import 'package:dio/dio.dart';
import 'package:nba_sdk/core/network/network.dart';


class DioClient extends ApiClient {
  final Dio _dio;

  DioClient({
    required Dio dio,
  }) : _dio = dio;

  @override
  Future<ApiResult<T>> get<T>(String path, {Map<String, dynamic>? queryParameters}) async {
    try {
      print('Making request to: ${_dio.options.baseUrl}$path?${queryParameters?.entries.map((e) => '${e.key}=${e.value}').join('&')}');
      final response = await _dio.get(path, queryParameters: queryParameters);
      if((response.statusCode ?? 0) >= 200 && (response.statusCode ?? 0) < 300){
        return ApiSuccess(data: response.data, statusCode: (response.statusCode ?? 200).toString());
      } else{
        return ApiError(statusCode: (response.statusCode ?? 200).toString(), error: response.statusMessage ?? '');
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  @override
  Future<ApiResult<T>> post<T>(String path, {Map<String, dynamic>? body, Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.post(path, data: body, queryParameters: queryParameters);
      if((response.statusCode ?? 0) >= 200 && (response.statusCode ?? 0) < 300){
        return ApiSuccess(data: response.data, statusCode: (response.statusCode ?? 200).toString());
      } else{
        return ApiError(statusCode: (response.statusCode ?? 200).toString(), error: response.statusMessage ?? '');
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ApiResult<T>> put<T>(String path, {Map<String, dynamic>? body, Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.put(path, data: body, queryParameters: queryParameters);
      if((response.statusCode ?? 0) >= 200 && (response.statusCode ?? 0) < 300){
        return ApiSuccess(data: response.data, statusCode: (response.statusCode ?? 200).toString());
      } else{
        return ApiError(statusCode: (response.statusCode ?? 200).toString(), error: response.statusMessage ?? '');
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ApiResult<T>> delete<T>(String path, {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.delete(path, queryParameters: queryParameters);
      if((response.statusCode ?? 0) >= 200 && (response.statusCode ?? 0) < 300){
        return ApiSuccess(data: response.data, statusCode: (response.statusCode ?? 200).toString());
      } else{
        return ApiError(statusCode: (response.statusCode ?? 200).toString(), error: response.statusMessage ?? '');
      }
    } catch (e) {
      rethrow;
    }
  }
  
}