// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_favorites_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetFavoritesModel _$GetFavoritesModelFromJson(Map<String, dynamic> json) =>
    GetFavoritesModel(
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetFavoritesModelToJson(GetFavoritesModel instance) =>
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
      mainId: (json['id'] as num).toInt(),
      product: Product.fromJson(json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataProToJson(DataPro instance) => <String, dynamic>{
      'id': instance.mainId,
      'product': instance.product,
    };

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: (json['id'] as num).toInt(),
      price: (json['price'] as num).toInt(),
      oldPrice: (json['old_price'] as num).toInt(),
      discount: (json['discount'] as num).toInt(),
      image: json['image'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'old_price': instance.oldPrice,
      'discount': instance.discount,
      'image': instance.image,
      'name': instance.name,
      'description': instance.description,
    };
