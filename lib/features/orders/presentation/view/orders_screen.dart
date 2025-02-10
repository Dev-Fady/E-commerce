import 'package:flutter/material.dart';
import 'widget/body_order_view.dart';

class OrdersScreen extends StatelessWidget {
  final List<Map<String, dynamic>> orders = [
    {"id": 44914, "total": 183.13, "date": "10 / 02 / 2025", "status": "جديد"},
    {"id": 44913, "total": 6382.86, "date": "10 / 02 / 2025", "status": "جديد"},
    {"id": 44912, "total": 0, "date": "10 / 02 / 2025", "status": "جديد"},
    {"id": 44911, "total": 37460.40, "date": "10 / 02 / 2025", "status": "جديد"},
    {"id": 44910, "total": 0, "date": "10 / 02 / 2025", "status": "جديد"},
    {"id": 44907, "total": 3505.80, "date": "10 / 02 / 2025", "status": "جديد"},
    {"id": 44902, "total": 104662.26, "date": "07 / 02 / 2025", "status": "جديد"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("الطلبات")),
      body: BodyOrderView(orders: orders),
    );
  }
}
