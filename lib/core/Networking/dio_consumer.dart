import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/AppError/exception.dart';
import 'package:ecommerce_app/core/Networking/api_constants.dart';
import 'package:ecommerce_app/core/Networking/api_consumer.dart';
import 'package:ecommerce_app/core/Networking/api_interceptor.dart';

class DioConsumer extends ApiConsumer{
  final Dio dio;
  Duration duration=const Duration(seconds: 60);
DioConsumer({
  required this.dio
}){
  dio.options.baseUrl=ApiConstants.apiBaseUrl;

  dio.options.receiveTimeout=duration;

  dio.options.connectTimeout=duration;

  dio.interceptors.add(
      LogInterceptor(
    error: true,
    requestHeader: true,
    requestBody: true,
    responseBody: true,
    request: true,
    responseHeader: true,

  ));

  dio.interceptors.add(ApiInterceptor());

  dio.options.validateStatus=(status){
    return status!<=505;
  };
}
  @override
  Future delete(String path, {Object? data, Map<String, dynamic>? queryParameters, bool isFromData = false}) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<dynamic>get(String path, {Object? data, Map<String, dynamic>? queryParameters}) async{
    try {
      Response? r = await dio.get(path);
      return r.data as Map<String,dynamic>;
    }
    catch(e){
      handleDioException(e);
    }

  }

  @override
  Future put(String path, {Object? data, Map<String, dynamic>? queryParameters
    , bool isFromData = false}) async{
    try {
      Response r = await dio.put(path, data: data);
      return r.data;
    }catch(e){
      handleDioException(e);
    }
  }

  @override
  Future post(String path, {Object? data, Map<String, dynamic>? queryParameters, bool isFromData = false}) async{
    try {
      Response? r = await dio.post(path, data: data);
      return r.data as Map<String,dynamic>;
    }catch(e){
      handleDioException(e);
    }
  }

}