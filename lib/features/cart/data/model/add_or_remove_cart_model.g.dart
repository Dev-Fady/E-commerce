// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_or_remove_cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddOrRemoveCartModel _$AddOrRemoveCartModelFromJson(
        Map<String, dynamic> json) =>
    AddOrRemoveCartModel(
      status: json['status'] as bool,
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : DataModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddOrRemoveCartModelToJson(
        AddOrRemoveCartModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

DataModel _$DataModelFromJson(Map<String, dynamic> json) => DataModel(
      mainId: (json['id'] as num).toInt(),
      product: json['product'] == null
          ? null
          : ProductModel.fromJson(json['product'] as Map<String, dynamic>),
      quantity: (json['quantity'] as num).toInt(),
    );

Map<String, dynamic> _$DataModelToJson(DataModel instance) => <String, dynamic>{
      'id': instance.mainId,
      'product': instance.product,
      'quantity': instance.quantity,
    };

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      id: (json['id'] as num).toInt(),
      price: (json['price'] as num).toInt(),
      oldPrice: (json['old_price'] as num).toInt(),
      discount: (json['discount'] as num).toInt(),
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
