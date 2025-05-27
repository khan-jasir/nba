abstract class ApiResult<T> {
  final T? data;
  final String? error;
  final String? statusCode;

  ApiResult({this.data, this.error, this.statusCode});
}

class ApiSuccess<T> extends ApiResult<T> {
  ApiSuccess({required T data, required String statusCode}) : super(data: data, statusCode: statusCode);
}

class ApiError<T> extends ApiResult<T> {
  ApiError({required String error, required String statusCode}) : super(error: error, statusCode: statusCode);
}






