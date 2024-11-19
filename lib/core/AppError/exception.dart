import 'package:dio/dio.dart';

class ServerException implements Exception{
  final String errorMsg;
  ServerException({
   required this.errorMsg
});
}

handleDioException(dynamic error){
  if(error is DioException){
    switch (error.type) {
      case DioExceptionType.connectionError:
        throw ServerException(errorMsg: "connection to the server failed due to internet connection");
      case DioExceptionType.cancel:
        throw ServerException(errorMsg:   "Request to the server was cancelled");
      case DioExceptionType.connectionTimeout:
        throw ServerException(errorMsg:   "Connection timeout with the server");
      case DioExceptionType.unknown:
        throw ServerException(errorMsg:
        "Connection to the server failed ");
      case DioExceptionType.receiveTimeout:
        throw ServerException(errorMsg:  "Receive timeout in connection with the server");
      case DioExceptionType.badResponse:
        throw ServerException(errorMsg:  "bad response");
      case DioExceptionType.sendTimeout:
        throw ServerException(errorMsg:
        "Send timeout in connection with the server");
      default:
        throw ServerException(errorMsg:   "Something went wrong");
    }
  } else {
    return  "Unknown error occurred";
  }
}

class CacheException implements Exception{
  final String errorMsg;
  CacheException({
    required this.errorMsg
  });
}