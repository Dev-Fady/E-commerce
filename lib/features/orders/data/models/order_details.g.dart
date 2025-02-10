// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderDetails _$OrderDetailsFromJson(Map<String, dynamic> json) => OrderDetails(
      status: json['status'] as bool?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrderDetailsToJson(OrderDetails instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: (json['id'] as num?)?.toInt(),
      cost: (json['cost'] as num?)?.toInt(),
      discount: (json['discount'] as num?)?.toInt(),
      points: (json['points'] as num?)?.toInt(),
      vat: (json['vat'] as num?)?.toDouble(),
      total: (json['total'] as num?)?.toDouble(),
      pointsCommission: (json['points_commission'] as num?)?.toInt(),
      promoCode: json['promo_code'] as String?,
      paymentMethod: json['payment_method'] as String?,
      date: json['date'] as String?,
      status: json['status'] as String?,
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => Products.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'cost': instance.cost,
      'discount': instance.discount,
      'points': instance.points,
      'vat': instance.vat,
      'total': instance.total,
      'points_commission': instance.pointsCommission,
      'promo_code': instance.promoCode,
      'payment_method': instance.paymentMethod,
      'date': instance.date,
      'status': instance.status,
      'address': instance.address,
      'products': instance.products,
    };

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      city: json['city'] as String?,
      region: json['region'] as String?,
      details: json['details'] as String?,
      notes: json['notes'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'city': instance.city,
      'region': instance.region,
      'details': instance.details,
      'notes': instance.notes,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };

Products _$ProductsFromJson(Map<String, dynamic> json) => Products(
      id: (json['id'] as num?)?.toInt(),
      quantity: (json['quantity'] as num?)?.toInt(),
      price: (json['price'] as num?)?.toInt(),
      name: json['name'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$ProductsToJson(Products instance) => <String, dynamic>{
      'id': instance.id,
      'quantity': instance.quantity,
      'price': instance.price,
      'name': instance.name,
      'image': instance.image,
    };
