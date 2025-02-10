import 'package:flutter/material.dart';

class PaymentDetails extends StatelessWidget {
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
            Text('المبلغ: 32,860 جنيه'),
            Text('الضريبة: 4,600 جنيه'),
            Text('الإجمالي: 37,460 جنيه',
                style: TextStyle(
                    color: Colors.green, fontWeight: FontWeight.bold)),
            Text('طريقة الدفع: اونلاين', style: TextStyle(color: Colors.blue)),
          ],
        ),
      ),
    );
  }
}
