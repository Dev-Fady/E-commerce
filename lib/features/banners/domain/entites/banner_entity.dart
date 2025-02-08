class BannerEntity {
  DataEntity data;

  BannerEntity({required this.data});
}

class DataEntity {
  List<BannersEntity> banners;
  List<Products> products;
  String ad;

  DataEntity({required this.banners, required this.products, required this.ad});
}

class BannersEntity {
  int? id;
  String? image;

  BannersEntity({required this.id, required this.image});
}

class Products {
  final int id;
  final double price;
  final double oldPrice;
  final int discount;
  final String image;
  final String name;
  final String description;
  final List<String> images;
  final bool inFavorites;
  final bool inCart;

  Products({
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
  });
}
