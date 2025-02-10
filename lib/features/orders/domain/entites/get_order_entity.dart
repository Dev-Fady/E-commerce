class GetOrderEntity {
  bool? status;
  OrderDataEntity? data;

  GetOrderEntity({this.status, this.data});
}

class OrderDataEntity {
  int? currentPage;
  List<OrderItemEntity>? data;

  OrderDataEntity({this.currentPage, this.data});
}

class OrderItemEntity {
  int? id;
  double? total;
  String? date;
  String? status;

  OrderItemEntity({this.id, this.total, this.date, this.status});
}
