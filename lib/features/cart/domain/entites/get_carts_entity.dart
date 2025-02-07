class GetCartsEntity extends Price {
  final int mainId; // ID الأساسي للمفضلة
  final int productId; // ID الخاص بالمنتج
  final int quantity;
  final int price;
  final int oldPrice;
  final int discount;
  final String image;
  final String name;
  final String description;

  GetCartsEntity({
    required this.mainId,
    required this.productId,
    required this.quantity,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
    required super.subTotal,
    required super.total,
  });
}

class Price {
  final double subTotal;
  final double total;

  Price({required this.subTotal, required this.total});
}
