class AddOrRemoveCartEntity {
  final bool status;
  final String message;
  final DataEntity? data;

  AddOrRemoveCartEntity({
    required this.status,
    required this.message,
    this.data,
  });
}

class DataEntity {
  final int mainId;
  final int quantity;
  final ProductEntity? product;

  DataEntity({
    required this.mainId,
    this.product,
    required this.quantity,
  });
}

class ProductEntity {
  final int productId;
  final int price;
  final int oldPrice;
  final int discount;
  final String image;

  ProductEntity({
    required this.productId,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
  });
}
