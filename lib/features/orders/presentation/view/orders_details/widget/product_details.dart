import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {
      "id": 56,
      "quantity": 1,
      "price": 32860,
      "name": "نيكون FX-format D750 - 24.3 ميجابيكسيل",
      "image":
          "https://student.valuxapps.com/storage/uploads/products/1615450256e0bZk.item_XXL_7582156_7501823.jpeg"
    },
    {
      "id": 56,
      "quantity": 1,
      "price": 32860,
      "name": "نيكون FX-format D750 - 24.3 ميجابيكسيل",
      "image":
          "https://student.valuxapps.com/storage/uploads/products/1615450256e0bZk.item_XXL_7582156_7501823.jpeg"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('المنتجات',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Divider(),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.all(16),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: products.length,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final product = products[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Row(
                    children: [
                      Image.network(
                        product['image'],
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product['name'],
                              style: TextStyle(fontWeight: FontWeight.bold),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text('السعر: ${product['price']} جنيه',
                                style: TextStyle(color: Colors.green)),
                            Text('الكمية: ${product['quantity']}'),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
