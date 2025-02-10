class AddOrdersEntity {
  bool? status;
  String? message;
  Data? data;

  AddOrdersEntity({this.status, this.message, this.data});
}

class Data {
  String? paymentMethod;
  int? cost;
  double? vat;
  int? discount;
  int? points;
  double? total;
  int? id;

  Data({
    this.paymentMethod,
    this.cost,
    this.vat,
    this.discount,
    this.points,
    this.total,
    this.id,
  });
}
