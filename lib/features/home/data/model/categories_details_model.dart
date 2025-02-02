import 'package:e_commerce/features/home/domain/entites/categories_details_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'categories_details_model.g.dart';

@JsonSerializable()
class CategoriesDetailsModel {
  final Data data;

  CategoriesDetailsModel({required this.data});

  factory CategoriesDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$CategoriesDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoriesDetailsModelToJson(this);
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
class DataPro extends CategoriesDetailsEntity {
  int? id;
  int? price;
  int? oldPrice;
  int? discount;
  final String image;
  final String name;
  final String description;
  final List<String> images;
   bool? inFavorites;
   bool? inCart;

  DataPro({
    this.id,
    this.price,
    this.oldPrice,
    this.discount,
    required this.image,
    required this.name,
    required this.description,
    required this.images,
    required this.inFavorites,
    required this.inCart,
  }) : super(
          id: id ?? 0,
          price: price ?? 0,
          oldPrice: oldPrice ?? 0,
          discount: discount ?? 0,
          image: image,
          name: name,
          description: description,
          images: images,
          inFavorites: inFavorites??false,
          inCart: inCart??false,
        );

  factory DataPro.fromJson(Map<String, dynamic> json) =>
      _$DataProFromJson(json);
  Map<String, dynamic> toJson() => _$DataProToJson(this);
}
