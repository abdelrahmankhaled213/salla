// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'homeDataCached.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HomeDataCachedAdapter extends TypeAdapter<HomeDataCached> {
  @override
  final int typeId = 0;

  @override
  HomeDataCached read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HomeDataCached(
      banners: (fields[1] as List).cast<BannersCached>(),
      products: (fields[2] as List).cast<ProductCached>(),
      status: fields[0] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, HomeDataCached obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.status)
      ..writeByte(1)
      ..write(obj.banners)
      ..writeByte(2)
      ..write(obj.products);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HomeDataCachedAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class BannersCachedAdapter extends TypeAdapter<BannersCached> {
  @override
  final int typeId = 1;

  @override
  BannersCached read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BannersCached(
      id: fields[0] as int,
      image: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, BannersCached obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BannersCachedAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ProductCachedAdapter extends TypeAdapter<ProductCached> {
  @override
  final int typeId = 2;

  @override
  ProductCached read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductCached(
      oldPrice: fields[2] as num,
      image: fields[3] as String?,
      name: fields[4] as String,
      description: fields[5] as String,
      id: fields[0] as int,
      price: fields[1] as num,
      discount: fields[6] as num,
      images: (fields[7] as List?)?.cast<String>(),
      inCart: fields[9] as bool,
      inFavorites: fields[8] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, ProductCached obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.price)
      ..writeByte(2)
      ..write(obj.oldPrice)
      ..writeByte(3)
      ..write(obj.image)
      ..writeByte(4)
      ..write(obj.name)
      ..writeByte(5)
      ..write(obj.description)
      ..writeByte(6)
      ..write(obj.discount)
      ..writeByte(7)
      ..write(obj.images)
      ..writeByte(8)
      ..write(obj.inFavorites)
      ..writeByte(9)
      ..write(obj.inCart);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductCachedAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
