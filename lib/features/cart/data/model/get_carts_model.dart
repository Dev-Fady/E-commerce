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
class Data extends Price {
  @JsonKey(name: 'cart_items')
  final List<CartItems> data;
  @JsonKey(name: 'sub_total')
  final double subTotal;
  final double total;

  Data({
    required this.data,
    required this.subTotal,
    required this.total,
  }) : super(
          subTotal: subTotal,
          total: total,
        );

  factory Data.fromJson(Map<String, dynamic> json) {
    final data = _$DataFromJson(json);
    return Data(
      data: data.data.map((item) {
        item.setSubTotalAndTotal(data.subTotal, data.total);
        return item;
      }).toList(),
      subTotal: data.subTotal,
      total: data.total,
    );
  }

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class CartItems extends GetCartsEntity {
  @JsonKey(name: 'id')
  final int mainId;
  @JsonKey(name: 'product')
  final Product product;
  final int quantity;

  /// ✅ `@JsonKey(ignore: true)` يمنع `subTotal` و `total` من الدخول في `fromJson` مباشرة
  @JsonKey(ignore: true)
 late double subTotal;

  @JsonKey(ignore: true)
 late double total;

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
          total: 0, // سيتم تحديثه لاحقًا
          subTotal: 0, // سيتم تحديثه لاحقًا
        );

  /// ✅ تحديث `subTotal` و `total` بعد التحويل من JSON
  void setSubTotalAndTotal(double subTotal, double total) {
    this.subTotal = subTotal;
    this.total = total;
  }

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

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
