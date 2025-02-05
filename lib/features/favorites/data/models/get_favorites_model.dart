import 'package:e_commerce/features/favorites/domain/entites/get_favorites_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_favorites_model.g.dart';

@JsonSerializable()
class GetFavoritesModel {
  final Data data;

  GetFavoritesModel({required this.data});

  factory GetFavoritesModel.fromJson(Map<String, dynamic> json) =>
      _$GetFavoritesModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetFavoritesModelToJson(this);
}

@JsonSerializable()
class Data {
  final int currentPage;
  final List<DataPro> data;
  final String firstPageUrl;
  final int from;
  final int lastPage;
  final String lastPageUrl;
  final String path;
  final int perPage;
  final int to;
  final int total;

  Data({
    required this.currentPage,
    required this.data,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    required this.path,
    required this.perPage,
    required this.to,
    required this.total,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class DataPro extends GetFavoritesEntity {
  @JsonKey(name: 'id')
  final int mainId;

  @JsonKey(name: 'product')
  final Product product;

  DataPro({
    required this.mainId,
    required this.product,
  }) : super(
          mainId: mainId,
          productId: product.id, // ID الخاص بالمنتج
          price: product.price,
          oldPrice: product.oldPrice,
          discount: product.discount,
          image: product.image,
          name: product.name,
          description: product.description,
        );

  factory DataPro.fromJson(Map<String, dynamic> json) =>
      _$DataProFromJson(json);

  Map<String, dynamic> toJson() => _$DataProToJson(this);
}

@JsonSerializable()
class Product {
  @JsonKey(name: 'id') // التقاط ID الخاص بالمنتج
  final int id;
  final int price;
  @JsonKey(name: 'old_price')
  final int oldPrice;
  final int discount;
  final String image;
  final String name;
  final String description;

  Product({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
