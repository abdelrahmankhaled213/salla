import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/AppError/exception.dart';
import 'package:ecommerce_app/core/Networking/api_constants.dart';
import 'package:ecommerce_app/core/Networking/api_consumer.dart';
import 'package:ecommerce_app/features/Home/Data/model/categoryData.dart';
import 'package:ecommerce_app/features/Home/Data/model/homeDataModel.dart';

class HomeRepo{
  late ApiConsumer apiConsumer;

  HomeRepo({required this.apiConsumer });

  Future<Either<String,HomeDataModel>> getHomeData()async{
    try{

      final response=await apiConsumer.get(ApiConstants.homeEndpoint);

      return Right(HomeDataModel.fromJson(response));

    }
    on ServerException catch(e){

  return Left(e.errorMsg);
}
    catch(e){
      return Left(e.toString());
    }


  }
  Future<Either<String,List<CategoryData>>> getCategories()async{

    try{

      final response=await apiConsumer.get(ApiConstants.categoriesEndpoint);

      return Right(List.from(response['data']['data'] ).map((e) => CategoryData.fromJson(e)).toList());
    }
    on ServerException catch(e){

      return Left(e.errorMsg);
    }
  }

}