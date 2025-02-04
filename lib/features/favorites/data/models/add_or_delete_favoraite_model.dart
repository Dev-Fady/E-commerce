import 'package:json_annotation/json_annotation.dart';
import '../../domain/entites/add_or_delete_favoraite_entity.dart';

part 'add_or_delete_favoraite_model.g.dart';

@JsonSerializable()
class AddOrDeleteFavoraiteModel {
  final bool status;
  final String message;
  final DataModel? data;

  AddOrDeleteFavoraiteModel({
    required this.status,
    required this.message,
    this.data,
  });

  factory AddOrDeleteFavoraiteModel.fromJson(Map<String, dynamic> json) =>
      _$AddOrDeleteFavoraiteModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddOrDeleteFavoraiteModelToJson(this);

  AddOrDeleteFavoraiteEntity toEntity() {
    return AddOrDeleteFavoraiteEntity(
      status: status,
      message: message,
      data: data?.toEntity(),
    );
  }
}

@JsonSerializable()
class DataModel {
  final int id;
  final ProductModel? product;

  DataModel({
    required this.id,
    this.product,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) =>
      _$DataModelFromJson(json);

  Map<String, dynamic> toJson() => _$DataModelToJson(this);

  DataEntity toEntity() {
    return DataEntity(
      id: id,
      product: product?.toEntity(),
    );
  }
}

@JsonSerializable()
class ProductModel {
  final int id;
  final int price;
  int? oldPrice;
  final int discount;
  final String image;

  ProductModel({
    required this.id,
    required this.price,
    this.oldPrice,
    required this.discount,
    required this.image,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);

  ProductEntity toEntity() {
    return ProductEntity(
      id: id,
      price: price,
      oldPrice: oldPrice ?? 0,
      discount: discount,
      image: image,
    );
  }
}
