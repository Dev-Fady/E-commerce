import 'package:flutter/material.dart';

class AddressDetails extends StatelessWidget {
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
            Text('المدينة: El Rehab City, New Cairo'),
            Text('التفاصيل: Group 60 - Building 5 - App 43'),
            Text('ملاحظات: No Notes'),
          ],
        ),
      ),
    );
  }
}
