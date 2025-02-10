
import 'package:e_commerce/features/orders/domain/entites/order_details_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_details.g.dart';

@JsonSerializable()
class OrderDetails {
  bool? status;
  Data? data;

  OrderDetails({this.status, this.data});

  factory OrderDetails.fromJson(Map<String, dynamic> json) => _$OrderDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$OrderDetailsToJson(this);

  OrderDetailsEntity toEntity() => OrderDetailsEntity(
        status: status,
        data: data?.toEntity(),
      );
}

@JsonSerializable()
class Data {
  int? id;
  int? cost;
  int? discount;
  int? points;
  double? vat;
  double? total;
  @JsonKey(name: 'points_commission')
  int? pointsCommission;
  @JsonKey(name: 'promo_code')
  String? promoCode;
  @JsonKey(name: 'payment_method')
  String? paymentMethod;
  String? date;
  String? status;
  Address? address;
  List<Products>? products;

  Data(
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

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);

  DataEntity toEntity() => DataEntity(
        id: id,
        cost: cost,
        discount: discount,
        points: points,
        vat: vat,
        total: total,
        pointsCommission: pointsCommission,
        promoCode: promoCode,
        paymentMethod: paymentMethod,
        date: date,
        status: status,
        address: address?.toEntity(),
        products: products?.map((e) => e.toEntity()).toList(),
      );
}

@JsonSerializable()
class Address {
  int? id;
  String? name;
  String? city;
  String? region;
  String? details;
  String? notes;
  double? latitude;
  double? longitude;

  Address(
      {this.id,
      this.name,
      this.city,
      this.region,
      this.details,
      this.notes,
      this.latitude,
      this.longitude});

  factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);
  Map<String, dynamic> toJson() => _$AddressToJson(this);

  AddressEntity toEntity() => AddressEntity(
        id: id,
        name: name,
        city: city,
        region: region,
        details: details,
        notes: notes,
        latitude: latitude,
        longitude: longitude,
      );
}

@JsonSerializable()
class Products {
  int? id;
  int? quantity;
  int? price;
  String? name;
  String? image;

  Products({this.id, this.quantity, this.price, this.name, this.image});

  factory Products.fromJson(Map<String, dynamic> json) => _$ProductsFromJson(json);
  Map<String, dynamic> toJson() => _$ProductsToJson(this);

  ProductsEntity toEntity() => ProductsEntity(
        id: id,
        quantity: quantity,
        price: price,
        name: name,
        image: image,
      );
}
