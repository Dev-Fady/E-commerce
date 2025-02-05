class GetFavoritesEntity {
  final int mainId; // ID الأساسي للمفضلة
  final int productId; // ID الخاص بالمنتج
  final int price;
  final int oldPrice;
  final int discount;
  final String image;
  final String name;
  final String description;

  GetFavoritesEntity({
    required this.mainId,
    required this.productId,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
  });
}
