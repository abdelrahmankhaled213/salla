import 'package:ecommerce_app/features/Home/Data/model/homeDataModel.dart';
import 'package:hive/hive.dart';

part 'homeDataCached.g.dart';

@HiveType(typeId: 0)

class HomeDataCached {
  @HiveField(0)

  final bool status;

  @HiveField(1)
final List<BannersCached> banners;

  @HiveField(2)
 final List<ProductCached> products;

  HomeDataCached({required this.banners,required this.products,required this.status});
  
  factory HomeDataCached.fromHomeDataModel(HomeDataModel homeDataModel) {

    return HomeDataCached(
      status: homeDataModel.status!,
      banners: homeDataModel.data.banners.map((e)
      => BannersCached(id: e.id, image: e.image),).toList()
      , products: homeDataModel.data.products.map((e)=>ProductCached.fromProduct(e)).toList()

    );
  }

  HomeDataModel toHomeDataModel(){

    return HomeDataModel(
    data: Data(banners: banners.map((e) 
    => Banners(id: e.id, image: e.image)).toList(),products: products.map((e)=>Product(
      id: e.id,
      price: e.price,
    name: e.name,
    description: e.description,
    discount: e.discount,
    images: e.images,
    inFavorites: e.inFavorites,
    inCart: e.inCart,
    oldPrice: e.oldPrice,
    image: e.image
    )
    ).toList()
    )
    );
  }
}

@HiveType(typeId: 1)

class BannersCached {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String? image;
  BannersCached({required this.id,required this.image});

  factory BannersCached.fromBanners(Banners banners){
    return BannersCached(id: banners.id, image: banners.image);
  }

  Banners toBanners(){
    return Banners(id: id, image: image);
  }

}

@HiveType(typeId: 2)

class ProductCached {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final num price;
  @HiveField(2)
  final num oldPrice;
  @HiveField(3)
  final String? image;
  @HiveField(4)
  final String name;
  @HiveField(5)
  final String description;
  @HiveField(6)
  final num discount;
  @HiveField(7)
  final  List<String>? images ;
  @HiveField(8)
  final bool inFavorites;
  @HiveField(9)
  final bool inCart;

  ProductCached({
    required this.oldPrice
    , required this.image
    , required this.name
    , required this.description,
    required this.id
    , required this.price
    , required this.discount
    , required this.images, required this.inCart, required this.inFavorites
  });

  factory ProductCached.fromProduct(Product product){

    return ProductCached(
      name: product.name,
      id: product.id,
      price: product.price,
      oldPrice: product.oldPrice,
      image: product.image,
      description: product.description,
      discount: product.discount,
      images: product.images,
      inFavorites: product.inFavorites,
      inCart: product.inCart
    );

  }

  Product toProduct(){
    return Product(
      name: name,
      id: id,
      price: price,
      oldPrice: oldPrice,
      image: image,
      description: description,
      discount: discount,
      images: images,
      inFavorites: inFavorites,
      inCart: inCart
    );
  }
}
