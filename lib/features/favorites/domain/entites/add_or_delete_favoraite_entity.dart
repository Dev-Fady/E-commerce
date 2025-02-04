class AddOrDeleteFavoraiteEntity {
  final bool status;
  final String message;
  final DataEntity? data;

  AddOrDeleteFavoraiteEntity({
    required this.status,
    required this.message,
    this.data,
  });
}

class DataEntity {
  final int id;
  final ProductEntity? product;

  DataEntity({
    required this.id,
    this.product,
  });
}

class ProductEntity {
  final int id;
  final int price;
  final int oldPrice;
  final int discount;
  final String image;

  ProductEntity({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
  });
}
