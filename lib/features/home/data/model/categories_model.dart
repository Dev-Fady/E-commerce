import 'package:json_annotation/json_annotation.dart';
import 'package:e_commerce/features/home/domain/entites/categories_entity.dart';

part 'categories_model.g.dart';

@JsonSerializable()
class CategoriesModel {
  bool status;
  dynamic message;
  Data data;

  CategoriesModel({
    required this.status,
    required this.message,
    required this.data,
  });

  // fromJson method
  factory CategoriesModel.fromJson(Map<String, dynamic> json) =>
      _$CategoriesModelFromJson(json);

  // toJson method
  Map<String, dynamic> toJson() => _$CategoriesModelToJson(this);
}

@JsonSerializable()
class Data {
  int currentPage;
  List<Datum> data;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  dynamic nextPageUrl;
  String path;
  int perPage;
  dynamic prevPageUrl;
  int to;
  int total;

  Data({
    required this.currentPage,
    required this.data,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    required this.nextPageUrl,
    required this.path,
    required this.perPage,
    required this.prevPageUrl,
    required this.to,
    required this.total,
  });

  // fromJson method
  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  // toJson method
  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Datum extends CategoriesEntity {
  int id;
  String name;
  String image;

  Datum({
    required this.id,
    required this.name,
    required this.image,
  }) : super(
          id: id,
          name: name,
          image: image,
        );

  // fromJson method
  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  // toJson method
  Map<String, dynamic> toJson() => _$DatumToJson(this);
}
