import 'package:flutter/material.dart';

class OrderCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        title: Text('رقم الطلب: 44911',
            style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('الحالة: جديد\nالتاريخ: 10 / 02 / 2025'),
        trailing: Icon(Icons.receipt_long, color: Colors.blue),
      ),
    );
  }
}
