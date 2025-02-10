class OrderDetailsEntity {
  bool? status;
  DataEntity? data;

  OrderDetailsEntity({this.status, this.data});
}

class DataEntity {
  int? id;
  int? cost;
  int? discount;
  int? points;
  double? vat;
  double? total;
  int? pointsCommission;
  String? promoCode;
  String? paymentMethod;
  String? date;
  String? status;
  AddressEntity? address;
  List<ProductsEntity>? products;

  DataEntity(
      {this.id,
      this.cost,
      this.discount,
      this.points,
      this.vat,
      this.total,
      this.pointsCommission,
      this.promoCode,
      this.paymentMethod,
      this.date,
      this.status,
      this.address,
      this.products});
}

class AddressEntity {
  int? id;
  String? name;
  String? city;
  String? region;
  String? details;
  String? notes;
  double? latitude;
  double? longitude;

  AddressEntity(
      {this.id,
      this.name,
      this.city,
      this.region,
      this.details,
      this.notes,
      this.latitude,
      this.longitude});
}

class ProductsEntity {
  int? id;
  int? quantity;
  int? price;
  String? name;
  String? image;

  ProductsEntity({this.id, this.quantity, this.price, this.name, this.image});
}
