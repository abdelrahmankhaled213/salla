import 'dart:async';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/AppError/exception.dart';
import 'package:ecommerce_app/core/Networking/api_constants.dart';
import 'package:ecommerce_app/core/Networking/api_consumer.dart';
import 'package:ecommerce_app/features/Favourites/Data/model/addToFavouriteResponse.dart';
import 'package:ecommerce_app/features/Favourites/Data/model/favouriteData.dart';



class FavouriteRepo {

  final ApiConsumer apiConsumer;

  FavouriteRepo({required this.apiConsumer});

  var products=<FavouriteData>[];


  Future<Either<String, AddOrRemoveResponse>> changeFavourite(int productId)

  async {

    try {

      final response = await apiConsumer.post(

          ApiConstants.favouriteEndpoint, data: {
        "product_id": productId
      });

      var favData=AddOrRemoveResponse.fromJson(response);

      await saveOrDeleteCacheData(favData);

      return Right(favData);
    }
    on ServerException catch (e) {
      return Left(e.errorMsg);
    }
  }

  Future<void> saveOrDeleteCacheData(AddOrRemoveResponse favData)
  async {

    if(favData.message=='Deleted Successfully'){


    log("deleted from cache");

    }

    else if(favData.message=='Added Successfully'){

    log("saved in cache");
    }
  }

Future<Either<String,List<FavouriteData>>> getFavourites()async{
    try{




final response=await apiConsumer.get(ApiConstants.favouriteEndpoint);

var tempProducts=<FavouriteData>[];

 for(var element in response['data']['data']){
   tempProducts.add(FavouriteData.fromJson(element['product']));
}

products.clear();
products.addAll(tempProducts);

return Right(products);

    }
    on ServerException catch(e) {

      return Left(e.errorMsg);

    }

  }

}