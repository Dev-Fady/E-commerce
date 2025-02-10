import 'package:flutter/material.dart';

import '../../../../domain/entites/order_details_entity.dart';

class AddressDetails extends StatelessWidget {
  const AddressDetails({super.key, required this.data});

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
            Text('عنوان التوصيل',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Divider(),
            Text('المدينة: ${data.data!.address!.city}'),
            Text('التفاصيل: ${data.data!.address!.details}'),
            Text('ملاحظات: ${data.data!.address!.notes}'),
          ],
        ),
      ),
    );
  }
}
