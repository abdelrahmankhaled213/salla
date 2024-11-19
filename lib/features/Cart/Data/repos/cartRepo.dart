import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/AppError/exception.dart';
import 'package:ecommerce_app/core/Networking/api_constants.dart';
import 'package:ecommerce_app/core/Networking/api_consumer.dart';
import 'package:ecommerce_app/features/Cart/Data/model/addOrDeleteCart.dart';
import 'package:ecommerce_app/features/Cart/Domain/entity/cartEntity.dart';
import 'package:ecommerce_app/features/Home/Data/model/homeDataModel.dart';

class CartRepo {
  ApiConsumer apiConsumer;

 CartRepo(this.apiConsumer);

 Future<Either<String,List<CartEntity>>> getCart() async {
   try{
     final response = await apiConsumer.get(ApiConstants.cartEndpoint);

     final List<CartEntity> cart=[];

     (response['data']['cart_items'] as List).forEach((element) {
 cart.add(CartEntity.fromProduct(  Product.fromJson(element['product']),{
       "id":element['id'],
     }));
     }) ;
     return Right(cart);
   } on ServerException catch(e){

     return Left(e.errorMsg);}

  }


  Future<Either<String,AddOrDeleteCartResponse>> addOrRemoveCart(int  cartEntityId) async {
    try{
      final response = await apiConsumer.post(ApiConstants.cartEndpoint,data: {
        "product_id":cartEntityId
      });
      return Right(AddOrDeleteCartResponse.fromJson(response));

    } on ServerException catch(e){

      return Left(e.errorMsg);

    }
  }

  Future<Either<String,String>> updateCart(int  cartEntityId) async {
    try{
      final response = await apiConsumer.put(ApiConstants.cartEndpoint,data: {
        "product_id":cartEntityId
      });
      return Right(response['message']);
    } on ServerException catch(e){

      return Left(e.errorMsg);
    }
  }

}