import 'package:e_commerce/features/home/domain/entites/product_search_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'product_search_model.g.dart';

@JsonSerializable()
class ProductSearchModel {
  DataModel? data;

  ProductSearchModel({this.data});

  factory ProductSearchModel.fromJson(Map<String, dynamic> json) =>
      _$ProductSearchModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductSearchModelToJson(this);
  ProductSearchEntity toEntity() {
    return ProductSearchEntity(
      data: data!.toEntity(),
    );
  }
}

@JsonSerializable()
class DataModel {
  int? currentPage;
  List<DataItem>? data;

  DataModel({this.currentPage, this.data});

  factory DataModel.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
  DataEntity toEntity() {
    return DataEntity(
      currentPage: currentPage,
      data: data?.map((item) => item.toEntity()).toList(),
    );
  }
}

@JsonSerializable()
class DataItem {
  int? id;
  double? price;
  String? image;
  String? name;
  String? description;
  List<String>? images;
  bool? inFavorites;
  bool? inCart;

  DataItem(
      {this.id,
      this.price,
      this.image,
      this.name,
      this.description,
      this.images,
      this.inFavorites,
      this.inCart});

  factory DataItem.fromJson(Map<String, dynamic> json) =>
      _$DataItemFromJson(json);

  Map<String, dynamic> toJson() => _$DataItemToJson(this);
  DataItemEntity toEntity() {
    return DataItemEntity(
      id: id,
      price: price,
      image: image,
      name: name,
      description: description,
      images: images,
      inFavorites: inFavorites,
      inCart: inCart,
    );
  }
}
