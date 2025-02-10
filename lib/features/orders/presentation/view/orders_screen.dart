import 'package:e_commerce/features/orders/presentation/view/oreders_view_rivepod_screen.dart';
import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("الطلبات")),
      body: OredersViewRivepodScreen(),
    );
  }
}
