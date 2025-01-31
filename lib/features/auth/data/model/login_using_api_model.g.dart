// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_using_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginUsingApiModel _$LoginUsingApiModelFromJson(Map<String, dynamic> json) =>
    LoginUsingApiModel(
      message: json['message'] as String,
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginUsingApiModelToJson(LoginUsingApiModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      image: json['image'] as String,
      points: (json['points'] as num).toInt(),
      credit: (json['credit'] as num).toInt(),
      token: json['token'] as String,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'image': instance.image,
      'points': instance.points,
      'credit': instance.credit,
      'token': instance.token,
    };
