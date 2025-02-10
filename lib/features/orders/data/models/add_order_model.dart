import 'package:e_commerce/features/orders/domain/entites/add_orders_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'add_order_model.g.dart';

@JsonSerializable()
class AddOrderModel {
  bool? status;
  String? message;
  DataModel? data;

  AddOrderModel({this.status, this.message, this.data});

  factory AddOrderModel.fromJson(Map<String, dynamic> json) =>
      _$AddOrderModelFromJson(json);
  Map<String, dynamic> toJson() => _$AddOrderModelToJson(this);

  // Convert AddOrderModel to AddOrdersEntity
  AddOrdersEntity toEntity() {
    return AddOrdersEntity(
      status: status,
      message: message,
      data: data?.toEntity(),
    );
  }
}

@JsonSerializable()
class DataModel {
  String? paymentMethod;
  int? cost;
  double? vat;
  int? discount;
  int? points;
  double? total;
  int? id;

  DataModel({
    this.paymentMethod,
    this.cost,
    this.vat,
    this.discount,
    this.points,
    this.total,
    this.id,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) =>
      _$DataModelFromJson(json);
  Map<String, dynamic> toJson() => _$DataModelToJson(this);

  // Convert DataModel to Data entity
  Data toEntity() {
    return Data(
      paymentMethod: paymentMethod,
      cost: cost,
      vat: vat,
      discount: discount,
      points: points,
      total: total,
      id: id,
    );
  }
}