// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetOrderModel _$GetOrderModelFromJson(Map<String, dynamic> json) =>
    GetOrderModel(
      status: json['status'] as bool?,
      data: json['data'] == null
          ? null
          : DataModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetOrderModelToJson(GetOrderModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

DataModel _$DataModelFromJson(Map<String, dynamic> json) => DataModel(
      currentPage: (json['currentPage'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => DataProModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataModelToJson(DataModel instance) => <String, dynamic>{
      'currentPage': instance.currentPage,
      'data': instance.data,
    };

DataProModel _$DataProModelFromJson(Map<String, dynamic> json) => DataProModel(
      id: (json['id'] as num?)?.toInt(),
      total: (json['total'] as num?)?.toDouble(),
      date: json['date'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$DataProModelToJson(DataProModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'total': instance.total,
      'date': instance.date,
      'status': instance.status,
    };
