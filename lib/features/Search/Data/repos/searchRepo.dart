import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/AppError/exception.dart';
import 'package:ecommerce_app/core/Networking/api_constants.dart';
import 'package:ecommerce_app/core/Networking/api_consumer.dart';

import 'package:ecommerce_app/features/Home/Data/model/homeDataModel.dart';

class SearchRepo {
  late ApiConsumer apiConsumer;
  SearchRepo({
   required this.apiConsumer
});

  final List<Product> _products = [];

  Future<Either<String,List<Product>>> search(String text) async {
try {

  _products.clear();

  final response = await apiConsumer.post(
      ApiConstants.searchEndpoint, data: text);

   response['data']['data'].forEach((element) {
  _products.add(Product.fromJson(element));
   }
   );
   return Right(_products);

}
on ServerException catch (e) {
  return Left(e.errorMsg);
}
  }
}