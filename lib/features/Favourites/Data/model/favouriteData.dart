import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'favouriteData.g.dart';


@JsonSerializable()

@HiveType(typeId: 4)

class FavouriteData extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String image;
  @HiveField(3)
  @JsonKey(name: 'old_price')
  final num oldPrice;

  @HiveField(4)
  final num discount;

  @HiveField(5)
  final num price;

  @HiveField(6)
  final String description;

  FavouriteData({
    required this.discount,
    required this.id,
    required this.name,
    required this.image,
    required this.oldPrice,
    required this.price,
    required this.description
  });

  factory FavouriteData.fromJson(Map<String, dynamic> json) =>
      _$FavouriteDataFromJson(json);
}
