class CategoriesDetailsEntity {
   int? id;
   int? price;
   int? oldPrice;
   int? discount;
  final String image;
  final String name;
  final String description;
  final List<dynamic> images;
   bool? inFavorites;
   bool? inCart;

  CategoriesDetailsEntity({
     this.id,
     this.price,
     this.oldPrice,
     this.discount,
    required this.image,
    required this.name,
    required this.description,
    required this.images,
     this.inFavorites,
     this.inCart,
  });
}
