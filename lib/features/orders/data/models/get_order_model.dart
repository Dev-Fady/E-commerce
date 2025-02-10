import 'package:e_commerce/features/orders/domain/entites/get_order_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_order_model.g.dart';

@JsonSerializable()
class GetOrderModel {
  bool? status;
  DataModel? data;

  GetOrderModel({this.status, this.data});

  factory GetOrderModel.fromJson(Map<String, dynamic> json) =>
      _$GetOrderModelFromJson(json);
  Map<String, dynamic> toJson() => _$GetOrderModelToJson(this);

  // Convert to Entity
  GetOrderEntity toEntity() {
    return GetOrderEntity(
      status: status,
      data: data?.toEntity(),
    );
  }
}

@JsonSerializable()
class DataModel {
  int? currentPage;
  List<DataProModel>? data;

  DataModel({this.currentPage, this.data});

  factory DataModel.fromJson(Map<String, dynamic> json) =>
      _$DataModelFromJson(json);
  Map<String, dynamic> toJson() => _$DataModelToJson(this);

  // Convert to Entity
  OrderDataEntity toEntity() {
    return OrderDataEntity(
      currentPage: currentPage,
      data: data?.map((e) => e.toEntity()).toList(),
    );
  }
}

@JsonSerializable()
class DataProModel {
  int? id;
  double? total;
  String? date;
  String? status;

  DataProModel({this.id, this.total, this.date, this.status});

  factory DataProModel.fromJson(Map<String, dynamic> json) =>
      _$DataProModelFromJson(json);
  Map<String, dynamic> toJson() => _$DataProModelToJson(this);

  // Convert to Entity
  OrderItemEntity toEntity() {
    return OrderItemEntity(
      id: id,
      total: total,
      date: date,
      status: status,
    );
  }
}
