// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_or_delete_favoraite_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddOrDeleteFavoraiteModel _$AddOrDeleteFavoraiteModelFromJson(
        Map<String, dynamic> json) =>
    AddOrDeleteFavoraiteModel(
      status: json['status'] as bool,
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : DataModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddOrDeleteFavoraiteModelToJson(
        AddOrDeleteFavoraiteModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

DataModel _$DataModelFromJson(Map<String, dynamic> json) => DataModel(
      id: (json['id'] as num).toInt(),
      product: json['product'] == null
          ? null
          : ProductModel.fromJson(json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataModelToJson(DataModel instance) => <String, dynamic>{
      'id': instance.id,
      'product': instance.product,
    };

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      id: (json['id'] as num).toInt(),
      price: (json['price'] as num).toInt(),
      oldPrice: (json['oldPrice'] as num?)?.toInt(),
      discount: (json['discount'] as num).toInt(),
      image: json['image'] as String,
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'oldPrice': instance.oldPrice,
      'discount': instance.discount,
      'image': instance.image,
    };
