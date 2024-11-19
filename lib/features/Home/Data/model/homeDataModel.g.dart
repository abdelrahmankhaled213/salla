// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'homeDataModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeDataModel _$HomeDataModelFromJson(Map<String, dynamic> json) =>
    HomeDataModel(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
      ad: json['ad'] as String?,
    );

Map<String, dynamic> _$HomeDataModelToJson(HomeDataModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
      'ad': instance.ad,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      banners: (json['banners'] as List<dynamic>)
          .map((e) => Banners.fromJson(e as Map<String, dynamic>))
          .toList(),
      products: (json['products'] as List<dynamic>)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'banners': instance.banners,
      'products': instance.products,
    };

Banners _$BannersFromJson(Map<String, dynamic> json) => Banners(
      id: (json['id'] as num).toInt(),
      image: json['image'] as String?,
    );

Map<String, dynamic> _$BannersToJson(Banners instance) => <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
    };

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: (json['id'] as num).toInt(),
      price: json['price'] as num,
      discount: json['discount'] as num,
      inCart: json['in_cart'] as bool,
      inFavorites: json['in_favorites'] as bool,
      oldPrice: json['old_price'] as num,
      image: json['image'] as String?,
      name: json['name'] as String,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      description: json['description'] as String,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'old_price': instance.oldPrice,
      'image': instance.image,
      'name': instance.name,
      'description': instance.description,
      'discount': instance.discount,
      'images': instance.images,
      'in_favorites': instance.inFavorites,
      'in_cart': instance.inCart,
    };
