import 'package:e_commerce/features/orders/domain/entites/order_details_entity.dart';
import 'package:flutter/material.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({super.key, required this.data});
  final OrderDetailsEntity data;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        title: Text('رقم الطلب: ${data.data!.id}',
            style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle:
            Text('الحالة: ${data.data!.status}\nالتاريخ:${data.data!.date}'),
        trailing: Icon(Icons.receipt_long, color: Colors.blue),
      ),
    );
  }
}
