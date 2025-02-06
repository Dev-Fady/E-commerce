// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_carts_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCartsModel _$GetCartsModelFromJson(Map<String, dynamic> json) =>
    GetCartsModel(
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetCartsModelToJson(GetCartsModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      data: (json['data'] as List<dynamic>)
          .map((e) => CartItems.fromJson(e as Map<String, dynamic>))
          .toList(),
      subTotal: (json['sub_total'] as num).toInt(),
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'data': instance.data,
      'sub_total': instance.subTotal,
      'total': instance.total,
    };

CartItems _$CartItemsFromJson(Map<String, dynamic> json) => CartItems(
      mainId: (json['id'] as num).toInt(),
      product: Product.fromJson(json['product'] as Map<String, dynamic>),
      quantity: (json['quantity'] as num).toInt(),
    );

Map<String, dynamic> _$CartItemsToJson(CartItems instance) => <String, dynamic>{
      'id': instance.mainId,
      'product': instance.product,
      'quantity': instance.quantity,
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
