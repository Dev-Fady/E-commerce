import 'package:e_commerce/features/profile/domian/entites/profile_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'profile_model.g.dart';

@JsonSerializable()
class ProfileModel extends ProfileEntity {
  final bool status;
  final Data data;

  ProfileModel({
    required this.status,
    required this.data,
  }) : super(
          name: data.name,
          id: data.id,
          email: data.email,
          phone: data.phone,
          image:data.image,
          points: data.points,
          credit: data.credit,
          token: data.token,
        );

          factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);

   Map<String, dynamic> oJson() => _$ProfileModelToJson(this);
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

  Data({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
    required this.points,
    required this.credit,
    required this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
