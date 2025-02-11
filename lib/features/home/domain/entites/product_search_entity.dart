class ProductSearchEntity {
  DataEntity? data;

  ProductSearchEntity({this.data});
}

class DataEntity {
  int? currentPage;
  List<DataItemEntity>? data;

  DataEntity({this.currentPage, this.data});
}

class DataItemEntity {
  int? id;
  double? price;
  String? image;
  String? name;
  String? description;
  List<String>? images;
  bool? inFavorites;
  bool? inCart;

  DataItemEntity({
    this.id,
    this.price,
    this.image,
    this.name,
    this.description,
    this.images,
    this.inFavorites,
    this.inCart,
  });
}
