import 'package:flutter/material.dart';

import '../../../../domain/entites/order_details_entity.dart';

class PaymentDetails extends StatelessWidget {
  const PaymentDetails({super.key, required this.data});

  final OrderDetailsEntity data;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('تفاصيل الدفع',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Divider(),
            Text('المبلغ: ${data.data!.cost} جنيه'),
            Text('الضريبة: ${data.data!.vat!.toStringAsFixed(2)} جنيه'),
            Text('الإجمالي:${data.data!.total!} جنيه',
                style: TextStyle(
                    color: Colors.green, fontWeight: FontWeight.bold)),
            Text('طريقة الدفع: ${data.data!.paymentMethod}',
                style: TextStyle(color: Colors.blue)),
          ],
        ),
      ),
    );
  }
}
