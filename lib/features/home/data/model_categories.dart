import 'package:e_commerce/features/home/domain/categories_entity.dart';

class ModelCategories {
  bool status;
  dynamic message;
  Data data;

  ModelCategories({
    required this.status,
    required this.message,
    required this.data,
  });

  // fromJson method for ModelCategories
  factory ModelCategories.fromJson(Map<String, dynamic> json) {
    return ModelCategories(
      status: json['status'],
      message: json['message'],
      data: Data.fromJson(json['data']), // Calling Data.fromJson for the nested object
    );
  }
}

class Data {
  int currentPage;
  List<Datum> data;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  dynamic nextPageUrl;
  String path;
  int perPage;
  dynamic prevPageUrl;
  int to;
  int total;

  Data({
    required this.currentPage,
    required this.data,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    required this.nextPageUrl,
    required this.path,
    required this.perPage,
    required this.prevPageUrl,
    required this.to,
    required this.total,
  });

  // fromJson method for Data
  factory Data.fromJson(Map<String, dynamic> json) {
    var dataList = (json['data'] as List).map((e) => Datum.fromJson(e)).toList();
    return Data(
      currentPage: json['current_page'],
      data: dataList,
      firstPageUrl: json['first_page_url'],
      from: json['from'],
      lastPage: json['last_page'],
      lastPageUrl: json['last_page_url'],
      nextPageUrl: json['next_page_url'],
      path: json['path'],
      perPage: json['per_page'],
      prevPageUrl: json['prev_page_url'],
      to: json['to'],
      total: json['total'],
    );
  }
}

class Datum extends CategoriesEntity {
  int id;
  String name;
  String image;

  Datum({
    required this.id,
    required this.name,
    required this.image,
  }) : super(
          id: id,
          name: name,
          image: image,
        );

  // fromJson method for Datum
  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      id: json['id'],
      name: json['name'],
      image: json['image'],
    );
  }
}
