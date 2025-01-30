import 'package:e_commerce/features/auth/domain/entites/register_using_api_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register_using_api_model.g.dart';

@JsonSerializable()
class RegisterUsingApiModel {
  bool status;
  String message;
  Data data;

  RegisterUsingApiModel(
      {required this.status, required this.message, required this.data});

  factory RegisterUsingApiModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterUsingApiModelFromJson(json);

  Map<String, dynamic> oJson() => _$RegisterUsingApiModelToJson(this);
}

@JsonSerializable()
class Data extends RegisterUsingApiEntity {
  final String name;
  final String phone;
  final String email;
  final int id;
  final String image;
  final String token;

  Data(
      {required this.name,
      required this.phone,
      required this.email,
      required this.id,
      required this.image,
      required this.token})
      : super(
          name: name,
          phone: phone,
          email: email,
          id: id,
          image: image,
          token: token,
        );

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
