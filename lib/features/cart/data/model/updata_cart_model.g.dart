// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'updata_cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdataCartModel _$UpdataCartModelFromJson(Map<String, dynamic> json) =>
    UpdataCartModel(
      status: json['status'] as bool,
      message: json['message'] as String,
      data: DataModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UpdataCartModelToJson(UpdataCartModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

DataModel _$DataModelFromJson(Map<String, dynamic> json) => DataModel(
      cart: CartModel.fromJson(json['cart'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataModelToJson(DataModel instance) => <String, dynamic>{
      'cart': instance.cart,
    };

CartModel _$CartModelFromJson(Map<String, dynamic> json) => CartModel(
      id: (json['id'] as num).toInt(),
      quantity: (json['quantity'] as num?)?.toInt(),
      product: ProductModel.fromJson(json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CartModelToJson(CartModel instance) => <String, dynamic>{
      'id': instance.id,
      'quantity': instance.quantity,
      'product': instance.product,
    };

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      id: (json['id'] as num).toInt(),
      price: (json['price'] as num).toInt(),
      oldPrice: (json['old_price'] as num?)?.toInt(),
      discount: (json['discount'] as num?)?.toInt(),
      image: json['image'] as String,
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'old_price': instance.oldPrice,
      'discount': instance.discount,
      'image': instance.image,
    };
