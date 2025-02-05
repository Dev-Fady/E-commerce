import 'package:e_commerce/features/cart/domain/entites/add_or_remove_cart_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'add_or_remove_cart_model.g.dart';

@JsonSerializable()
class AddOrRemoveCartModel {
  final bool status;
  final String message;
  final DataModel? data;

  AddOrRemoveCartModel({
    required this.status,
    required this.message,
    this.data,
  });

  factory AddOrRemoveCartModel.fromJson(Map<String, dynamic> json) =>
      _$AddOrRemoveCartModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddOrRemoveCartModelToJson(this);

  AddOrRemoveCartEntity toEntity() {
    return AddOrRemoveCartEntity(
      status: status,
      message: message,
      data: data?.toEntity(),
    );
  }
}

@JsonSerializable()
class DataModel {
  @JsonKey(name: 'id')
  final int mainId;
  final ProductModel? product;
  final int quantity;

  DataModel({
    required this.mainId,
    this.product,
    required this.quantity,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) =>
      _$DataModelFromJson(json);

  Map<String, dynamic> toJson() => _$DataModelToJson(this);

  DataEntity toEntity() {
    return DataEntity(
      mainId: mainId,
      product: product?.toEntity(),
      quantity: quantity,
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

  ProductEntity toEntity() {
    return ProductEntity(
      productId: id,
      price: price,
      oldPrice: oldPrice,
      discount: discount,
      image: image,
    );
  }
}
