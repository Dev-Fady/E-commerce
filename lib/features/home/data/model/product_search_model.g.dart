// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_search_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductSearchModel _$ProductSearchModelFromJson(Map<String, dynamic> json) =>
    ProductSearchModel(
      data: json['data'] == null
          ? null
          : DataModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductSearchModelToJson(ProductSearchModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

DataModel _$DataFromJson(Map<String, dynamic> json) => DataModel(
      currentPage: (json['currentPage'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => DataItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(DataModel instance) => <String, dynamic>{
      'currentPage': instance.currentPage,
      'data': instance.data,
    };

DataItem _$DataItemFromJson(Map<String, dynamic> json) => DataItem(
      id: (json['id'] as num?)?.toInt(),
      price: (json['price'] as num?)?.toDouble(),
      image: json['image'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      inFavorites: json['inFavorites'] as bool?,
      inCart: json['inCart'] as bool?,
    );

Map<String, dynamic> _$DataItemToJson(DataItem instance) => <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'image': instance.image,
      'name': instance.name,
      'description': instance.description,
      'images': instance.images,
      'inFavorites': instance.inFavorites,
      'inCart': instance.inCart,
    };
