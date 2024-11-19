import 'package:freezed_annotation/freezed_annotation.dart';
part 'homeDataModel.g.dart';

@JsonSerializable()
class HomeDataModel {
  final bool? status;
  final String? message;
  final Data data;
final String? ad;
  HomeDataModel({
     this.status,
    this.message,
    required this.data,
    this.ad
  });

  factory HomeDataModel.fromJson(Map<String, dynamic> json) => _$HomeDataModelFromJson(json);

}
@JsonSerializable()
class Data {
  final List<Banners> banners;
 final List<Product> products;
  Data({required this.banners,required this.products});
  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
@JsonSerializable()
class Banners {
final int id;
final String? image;
Banners({required this.id,required this.image});

factory Banners.fromJson(Map<String, dynamic> json) => _$BannersFromJson(json);
}
@JsonSerializable()
class Product{
final int id;
final num price;
@JsonKey(name: "old_price")
final num oldPrice;
final String? image;
final String name;
final String description;
final num discount;
final  List<String>? images ;
@JsonKey(name: "in_favorites")
final bool inFavorites;
@JsonKey(name: "in_cart")
final bool inCart;
Product({required this.id,required this.price,required this.discount,required this.inCart,required this.inFavorites
  ,required this.oldPrice, this.image,required this.name,this.images,required this.description});

factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

}