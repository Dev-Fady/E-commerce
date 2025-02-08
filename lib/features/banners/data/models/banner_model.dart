import 'package:e_commerce/features/banners/domain/entites/banner_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'banner_model.g.dart';

@JsonSerializable()
class BannerModel {
  Data data;

  BannerModel({required this.data});

  factory BannerModel.fromJson(Map<String, dynamic> json) =>
      _$BannerModelFromJson(json);
  Map<String, dynamic> toJson() => _$BannerModelToJson(this);

  BannerEntity toEntity() {
    return BannerEntity(
      data: data.toEntity(),
    );
  }
}

@JsonSerializable()
class Data {
  List<Banners> banners;
  List<ProductsModel> products;
  String ad;

  Data({required this.banners, required this.products, required this.ad});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);

  DataEntity toEntity() {
    return DataEntity(
      banners: banners.map((banner) => banner.toEntity()).toList(),
      products: products.map((product) => product.toEntity()).toList(),
      ad: ad,
    );
  }
}

@JsonSerializable()
class Banners {
  int? id;
  String? image;

  Banners({required this.id, required this.image});

  factory Banners.fromJson(Map<String, dynamic> json) =>
      _$BannersFromJson(json);
  Map<String, dynamic> toJson() => _$BannersToJson(this);

  BannersEntity toEntity() {
    return BannersEntity(id: id, image: image);
  }
}

@JsonSerializable()
class ProductsModel {
  final int id;
  final double price;
  @JsonKey(name: 'old_price')
  final double oldPrice;
  final int discount;
  final String image;
  final String name;
  final String description;
  final List<String> images;
  @JsonKey(name: 'in_favorites')
  final bool inFavorites;
  @JsonKey(name: 'in_cart')
  final bool inCart;

  ProductsModel({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
    required this.images,
    required this.inFavorites,
    required this.inCart,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) =>
      _$ProductsModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductsModelToJson(this);

  Products toEntity() {
    return Products(
      id: id,
      price: price,
      oldPrice: oldPrice,
      discount: discount,
      image: image,
      name: name,
      description: description,
      images: images,
      inFavorites: inFavorites,
      inCart: inCart,
    );
  }
}
