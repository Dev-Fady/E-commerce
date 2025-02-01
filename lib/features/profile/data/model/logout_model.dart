import 'package:json_annotation/json_annotation.dart';
part 'logout_model.g.dart';

@JsonSerializable()
class LogoutModel {
  final bool status;
  final String message;
  final Data data;

  LogoutModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory LogoutModel.fromJson(Map<String, dynamic> json) =>
      _$LogoutModelFromJson(json);

  Map<String, dynamic> toJson() => _$LogoutModelToJson(this);
}

@JsonSerializable()
class Data {
  final int id;
  final String token;

  Data({
    required this.id,
    required this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
