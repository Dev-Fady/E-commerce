import 'package:e_commerce/features/auth/domain/entites/login_using_api_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_using_api_model.g.dart';

@JsonSerializable()
class LoginUsingApiModel extends LoginUsingApiEntity {
  final String message;
  final Data data;

  LoginUsingApiModel({required this.message, required this.data})
      : super(
            message: message,
            id: data.id,
            name: data.name,
            email: data.email,
            phone: data.phone,
            image: data.image,
            points: data.points,
            credit: data.credit,
            token: data.token);

            factory LoginUsingApiModel.fromJson(Map<String, dynamic> json) =>
      _$LoginUsingApiModelFromJson(json);
  Map<String, dynamic> toJson() => _$LoginUsingApiModelToJson(this);

   Map<String, dynamic> oJson() => _$LoginUsingApiModelToJson(this);
}

@JsonSerializable()
class Data {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String image;
  final int points;
  final int credit;
  final String token;

  Data(
      {required this.id,
      required this.name,
      required this.email,
      required this.phone,
      required this.image,
      required this.points,
      required this.credit,
      required this.token});

      factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);

  Map<String, dynamic> oJson() => _$DataToJson(this);
}
