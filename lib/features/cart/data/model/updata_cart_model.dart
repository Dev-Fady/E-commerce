import 'package:e_commerce/features/cart/domain/entites/updata_cart_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'updata_cart_model.g.dart';

@JsonSerializable()
class UpdataCartModel {
  final bool status;
  final String message;
  final DataModel data;

  UpdataCartModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory UpdataCartModel.fromJson(Map<String, dynamic> json) =>
      _$UpdataCartModelFromJson(json);

  Map<String, dynamic> toJson() => _$UpdataCartModelToJson(this);

  // تحويل من Model إلى Entity
  UpdataCartEntity toEntity() {
    return UpdataCartEntity(
      status: status,
      message: message,
      data: data.toEntity(),
    );
  }
}

@JsonSerializable()
class DataModel {
  final CartModel cart;

  DataModel({
    required this.cart,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) =>
      _$DataModelFromJson(json);

  Map<String, dynamic> toJson() => _$DataModelToJson(this);

  // تحويل من DataModel إلى Entity
  DataEntity toEntity() {
    return DataEntity(
      cart: cart.toEntity(),
    );
  }
}

@JsonSerializable()
class CartModel {
  final int id;
  final int? quantity;
  final ProductModel product;

  CartModel({required this.id,  this.quantity, required this.product});

  factory CartModel.fromJson(Map<String, dynamic> json) =>
      _$CartModelFromJson(json);
  Map<String, dynamic> toJson() => _$CartModelToJson(this);

  // تحويل من Cart ��لى Entity
  CartEntity toEntity() {
    return CartEntity(
      id: id,
      quantity: quantity??0,
      product: product.toEntity(),
    );
  }
}

@JsonSerializable()
class ProductModel {
  final int id;
  final int price;
  @JsonKey(name: 'old_price')
  final int? oldPrice;
  final int? discount;
  final String image;

  ProductModel({
    required this.id,
    required this.price,
    this.oldPrice,
    this.discount,
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
      oldPrice: oldPrice ?? 0,
      discount: discount ?? 0,
      image: image,
    );
  }
}
