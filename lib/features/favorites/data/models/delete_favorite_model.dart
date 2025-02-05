import 'package:e_commerce/features/favorites/domain/entites/delete_favoraite_Entitty.dart';
import 'package:json_annotation/json_annotation.dart';

part 'delete_favorite_model.g.dart';

@JsonSerializable()
class DeleteFavoriteModel {
  final bool status;
  final String message;
  final DataModel data;

  DeleteFavoriteModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory DeleteFavoriteModel.fromJson(Map<String, dynamic> json) =>
      _$DeleteFavoriteModelFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteFavoriteModelToJson(this);

  // تحويل من Model إلى Entity
  DeleteFavoraiteEntitty toEntity() {
    return DeleteFavoraiteEntitty(
      status: status,
      message: message,
      data: data.toEntity(),
    );
  }
}

@JsonSerializable()
class DataModel {
  final int id;
  final ProductModel product;

  DataModel({
    required this.id,
    required this.product,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) =>
      _$DataModelFromJson(json);

  Map<String, dynamic> toJson() => _$DataModelToJson(this);

  // تحويل من DataModel إلى Entity
  DataEntity toEntity() {
    return DataEntity(
      id: id,
      product: product.toEntity(),
    );
  }
}

@JsonSerializable()
class ProductModel {
  final int id;
  final int price;
  @JsonKey(name: 'old_price')
  final int oldPrice;
  final int discount;
  final String image;

  ProductModel({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);

  // تحويل من ProductModel إلى Entity
  ProductEntity toEntity() {
    return ProductEntity(
      id: id,
      price: price,
      oldPrice: oldPrice,
      discount: discount,
      image: image,
    );
  }
}
