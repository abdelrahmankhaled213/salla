import 'package:ecommerce_app/features/Home/Data/model/homeDataModel.dart';

class CartEntity{
  final  int cartId;
  final int id;
  final String image;
  final num price;
  final num oldPrice;
  final String name;

  CartEntity({required this.cartId,required this.id
  ,required this.name,required this.image,required this.price,required this.oldPrice});


  factory CartEntity.fromProduct(Product product,Map<String,dynamic> cartIdd)
  {
    return CartEntity(cartId:cartIdd['id'] ,id: product.id, name: product.name
        , image: product.image!, price: product.price, oldPrice: product.oldPrice);
  }
}