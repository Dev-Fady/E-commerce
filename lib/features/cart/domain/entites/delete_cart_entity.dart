class DeleteCartEntity {
  final bool status;
  final String message;
  final DataEntity? data;

  DeleteCartEntity({
    required this.status,
    required this.message,
    this.data,
  });
}

class DataEntity {
  final CartEntity? cart;

  DataEntity({
    this.cart,
  });
}

class CartEntity {
  final int id;
  final int quantity;
  final ProductEntity? product;
  CartEntity({
    required this.id,
    required this.quantity,
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
