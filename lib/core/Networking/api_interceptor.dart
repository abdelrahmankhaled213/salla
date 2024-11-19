import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/Di/dependencyInjection.dart';
import 'package:ecommerce_app/core/Theming/AppText.dart';
import 'package:ecommerce_app/core/database/cacheHelper.dart';

class ApiInterceptor extends Interceptor{
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['lang']="en";
    options.headers['Authorization']="${getIt<CacheHelper>().getData(key: AppText.token)??""}";
    super.onRequest(options, handler);
  }
}