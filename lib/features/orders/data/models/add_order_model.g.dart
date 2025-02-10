// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddOrderModel _$AddOrderModelFromJson(Map<String, dynamic> json) =>
    AddOrderModel(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : DataModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddOrderModelToJson(AddOrderModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

DataModel _$DataModelFromJson(Map<String, dynamic> json) => DataModel(
      paymentMethod: json['paymentMethod'] as String?,
      cost: (json['cost'] as num?)?.toInt(),
      vat: (json['vat'] as num?)?.toDouble(),
      discount: (json['discount'] as num?)?.toInt(),
      points: (json['points'] as num?)?.toInt(),
      total: (json['total'] as num?)?.toDouble(),
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DataModelToJson(DataModel instance) => <String, dynamic>{
      'paymentMethod': instance.paymentMethod,
      'cost': instance.cost,
      'vat': instance.vat,
      'discount': instance.discount,
      'points': instance.points,
      'total': instance.total,
      'id': instance.id,
    };
