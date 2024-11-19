import 'package:json_annotation/json_annotation.dart';

class AddOrRemoveResponse {
  final bool status;
  final String message;
  final  OurFavouritesData favData;

  AddOrRemoveResponse({required this.favData,required this.status, required this.message});


  factory AddOrRemoveResponse.fromJson(Map<String, dynamic> json) {
    return AddOrRemoveResponse(
      status: json['status'],
      message: json['message'],
      favData: OurFavouritesData.fromJson(json['data']),

    );
  }

}
class OurFavouritesData {
  final int id;
  final String image;
@JsonKey(name: 'old_price')
  final num oldPrice;
  final num price;
  final String discount;

  OurFavouritesData({required this.discount,required this.id,required this.image,required this.oldPrice,required this.price});

  factory OurFavouritesData.fromJson(Map<String, dynamic> json) {
    return OurFavouritesData(
      discount: json['discount'],
      id: json['id'],
      image: json['image'],
      oldPrice: json['old_price'],
      price: json['price'],
    );
  }
}
