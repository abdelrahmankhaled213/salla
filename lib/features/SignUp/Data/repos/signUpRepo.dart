import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/AppError/exception.dart';
import 'package:ecommerce_app/core/Di/dependencyInjection.dart';
import 'package:ecommerce_app/core/Networking/dio_consumer.dart';
import 'package:ecommerce_app/core/database/cacheHelper.dart';
import 'package:ecommerce_app/features/SignUp/Data/model/SignUpRequest.dart';
import 'package:ecommerce_app/features/SignUp/Data/model/SignUpResponse.dart';
import '../../../../core/Networking/api_consumer.dart';

class SignUpRepo {
  final ApiConsumer apiConsumer;
  SignUpRepo({
   required this.apiConsumer
});

  Future<Either<String,SignUpResponse>>signUp(SignUpRequest signUpRequest)async{
    try {
      final myData = await apiConsumer.post("register",data:signUpRequest.toJson()) ?? <String,dynamic>{} ;
      return Right(SignUpResponse.fromJson(myData));
    }on ServerException catch(e){
      print("my error : "+  "${e.errorMsg}");
      return Left(e.errorMsg);
    }catch(e){
      print("my error :" + e.toString());
      return Left(e.toString());
    }


  }


}