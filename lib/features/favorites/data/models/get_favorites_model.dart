import 'package:e_commerce/features/favorites/domain/entites/get_favorites_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'get_favorites_model.g.dart';

@JsonSerializable()
class GetFavoritesModel {
  final Data data;

  GetFavoritesModel({required this.data});

  factory GetFavoritesModel.fromJson(Map<String, dynamic> json) =>
      _$GetFavoritesModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetFavoritesModelToJson(this);
}

@JsonSerializable()
class Data {
  final int currentPage;
  final List<DataPro> data;
  final String firstPageUrl;
  final int from;
  final int lastPage;
  final String lastPageUrl;
  final String path;
  final int perPage;
  final int to;
  final int total;

  Data({
    required this.currentPage,
    required this.data,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    required this.path,
    required this.perPage,
    required this.to,
    required this.total,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class DataPro extends GetFavoritesEntity {
  int? id;
  int? price;
  int? oldPrice;
  int? discount;
  final String image;
  final String name;
  final String description;

  DataPro({
    this.id,
    this.price,
    this.oldPrice,
    this.discount,
    required this.image,
    required this.name,
    required this.description,
  }) : super(
          id: id ?? 0,
          price: price ?? 0,
          oldPrice: oldPrice ?? 0,
          discount: discount ?? 0,
          image: image,
          name: name,
          description: description,
        );

  factory DataPro.fromJson(Map<String, dynamic> json) =>
      _$DataProFromJson(json);
  Map<String, dynamic> toJson() => _$DataProToJson(this);
}
