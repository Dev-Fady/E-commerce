class GetFavoritesEntity {
  int? id;
  int? price;
  int? oldPrice;
  int? discount;
  final String image;
  final String name;
  final String description;

  GetFavoritesEntity({
    this.id,
    this.price,
    this.oldPrice,
    this.discount,
    required this.image,
    required this.name,
    required this.description,
  });
}
