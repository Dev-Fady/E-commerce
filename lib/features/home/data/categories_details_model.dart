import 'package:e_commerce/features/home/domain/categories_details_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'categories_details_model.g.dart';

@JsonSerializable()
class CategoriesDetailsModel {
  final Data data;

  CategoriesDetailsModel({required this.data});

  factory CategoriesDetailsModel.fromJson(Map<String, dynamic> json) => _$CategoriesDetailsModelFromJson(json);

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
  final int id;
  final int price;
  final int oldPrice;
  final int discount;
  final String image;
  final String name;
  final String description;
  final List<String> images;
  final bool inFavorites;
  final bool inCart;

  DataPro({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
    required this.images,
    required this.inFavorites,
    required this.inCart,
  }) : super(
          id: id,
          price: price,
          oldPrice: oldPrice,
          discount: discount,
          image: image,
          name: name,
          description: description,
          images: images,
          inFavorites: inFavorites,
          inCart: inCart,
        );

         factory DataPro.fromJson(Map<String, dynamic> json) => _$DataProFromJson(json);
         Map<String, dynamic> toJson() => _$DataProToJson(this);
}
