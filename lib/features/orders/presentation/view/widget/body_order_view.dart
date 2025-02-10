import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class BodyOrderView extends StatelessWidget {
  const BodyOrderView({
    super.key,
    required this.orders,
  });

  final List<Map<String, dynamic>> orders;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          final isZero = order['total'] == 0;
          return Card(
            color: isZero ? Colors.grey[200] : Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: isZero ? 0 : 3,
            margin: EdgeInsets.symmetric(vertical: 6),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: isZero ? Colors.grey : Colors.blue,
                child: Icon(
                  isZero ? Icons.close : Icons.check,
                  color: Colors.white,
                ),
              ),
              title: Text("رقم الطلب: ${order['id']}",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text("التاريخ: ${order['date']}"),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${NumberFormat('#,##0.00').format(order['total'])} جنيه",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: isZero ? Colors.grey : Colors.green,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    order['status'],
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
