import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/AppError/exception.dart';
import 'package:ecommerce_app/core/Networking/api_consumer.dart';
import 'package:ecommerce_app/features/SignIn/Data/model/SignInRequest.dart';
import 'package:ecommerce_app/features/SignIn/Data/model/SignInResponse.dart';

class SignInRepo{
  final ApiConsumer apiConsumer;
  const SignInRepo(
     this.apiConsumer
);

  Future<Either<String,SignInResponse>>login
      (String endPoint,{required SignInRequest signInRequest})async{
    try {
      final responseData = await apiConsumer.post(
          endPoint, data: signInRequest.toJson(signInRequest));
      return Right(SignInResponse.fromJson(responseData));
    }on ServerException catch(e){
      return Left(e.errorMsg);
    }

}
}