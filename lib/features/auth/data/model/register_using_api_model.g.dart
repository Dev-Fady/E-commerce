// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_using_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterUsingApiModel _$RegisterUsingApiModelFromJson(
        Map<String, dynamic> json) =>
    RegisterUsingApiModel(
      status: json['status'] as bool,
      message: json['message'] as String,
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RegisterUsingApiModelToJson(
        RegisterUsingApiModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      name: json['name'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String,
      id: (json['id'] as num).toInt(),
      image: json['image'] as String,
      token: json['token'] as String,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'name': instance.name,
      'phone': instance.phone,
      'email': instance.email,
      'id': instance.id,
      'image': instance.image,
      'token': instance.token,
    };
