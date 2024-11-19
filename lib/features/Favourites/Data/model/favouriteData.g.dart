// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favouriteData.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavouriteDataAdapter extends TypeAdapter<FavouriteData> {
  @override
  final int typeId = 4;

  @override
  FavouriteData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavouriteData(
      discount: fields[4] as num,
      id: fields[0] as int,
      name: fields[1] as String,
      image: fields[2] as String,
      oldPrice: fields[3] as num,
      price: fields[5] as num,
      description: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FavouriteData obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.image)
      ..writeByte(3)
      ..write(obj.oldPrice)
      ..writeByte(4)
      ..write(obj.discount)
      ..writeByte(5)
      ..write(obj.price)
      ..writeByte(6)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavouriteDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavouriteData _$FavouriteDataFromJson(Map<String, dynamic> json) =>
    FavouriteData(
      discount: json['discount'] as num,
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      image: json['image'] as String,
      oldPrice: json['old_price'] as num,
      price: json['price'] as num,
      description: json['description'] as String,
    );

Map<String, dynamic> _$FavouriteDataToJson(FavouriteData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'old_price': instance.oldPrice,
      'discount': instance.discount,
      'price': instance.price,
      'description': instance.description,
    };
