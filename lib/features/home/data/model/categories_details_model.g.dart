// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoriesDetailsModel _$CategoriesDetailsModelFromJson(
        Map<String, dynamic> json) =>
    CategoriesDetailsModel(
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CategoriesDetailsModelToJson(
        CategoriesDetailsModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      currentPage: (json['currentPage'] as num).toInt(),
      data: (json['data'] as List<dynamic>)
          .map((e) => DataPro.fromJson(e as Map<String, dynamic>))
          .toList(),
      firstPageUrl: json['firstPageUrl'] as String,
      from: (json['from'] as num).toInt(),
      lastPage: (json['lastPage'] as num).toInt(),
      lastPageUrl: json['lastPageUrl'] as String,
      path: json['path'] as String,
      perPage: (json['perPage'] as num).toInt(),
      to: (json['to'] as num).toInt(),
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'currentPage': instance.currentPage,
      'data': instance.data,
      'firstPageUrl': instance.firstPageUrl,
      'from': instance.from,
      'lastPage': instance.lastPage,
      'lastPageUrl': instance.lastPageUrl,
      'path': instance.path,
      'perPage': instance.perPage,
      'to': instance.to,
      'total': instance.total,
    };

DataPro _$DataProFromJson(Map<String, dynamic> json) => DataPro(
      id: (json['id'] as num).toInt(),
      price: (json['price'] as num).toInt(),
      oldPrice: (json['oldPrice'] as num).toInt(),
      discount: (json['discount'] as num).toInt(),
      image: json['image'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      inFavorites: json['inFavorites'] as bool,
      inCart: json['inCart'] as bool,
    );

Map<String, dynamic> _$DataProToJson(DataPro instance) => <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'oldPrice': instance.oldPrice,
      'discount': instance.discount,
      'image': instance.image,
      'name': instance.name,
      'description': instance.description,
      'images': instance.images,
      'inFavorites': instance.inFavorites,
      'inCart': instance.inCart,
    };
