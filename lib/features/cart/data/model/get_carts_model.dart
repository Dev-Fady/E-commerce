import 'package:e_commerce/features/cart/domain/entites/get_carts_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_carts_model.g.dart';

@JsonSerializable()
class GetCartsModel {
  final Data data;

  GetCartsModel({required this.data});

  factory GetCartsModel.fromJson(Map<String, dynamic> json) =>
      _$GetCartsModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetCartsModelToJson(this);
}

@JsonSerializable()
class Data {
  final List<CartItems> data;
  @JsonKey(name: 'sub_total')
  final int subTotal;
  final int total;

  Data({
    required this.data,
    required this.subTotal,
    required this.total,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class CartItems extends GetCartsEntity {
  @JsonKey(name: 'id')
  final int mainId;
  @JsonKey(name: 'product')
  final Product product;
  final int quantity;

  CartItems({
    required this.mainId,
    required this.product,
    required this.quantity,
  }) : super(
          mainId: mainId,
          productId: product.id,
          price: product.price,
          oldPrice: product.oldPrice,
          discount: product.discount,
          image: product.image,
          name: product.name,
          description: product.description,
          quantity: quantity,
        );

  factory CartItems.fromJson(Map<String, dynamic> json) =>
      _$CartItemsFromJson(json);

  Map<String, dynamic> toJson() => _$CartItemsToJson(this);
}

@JsonSerializable()
class Product {
  @JsonKey(name: 'id')
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
