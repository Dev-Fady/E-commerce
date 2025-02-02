import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BuildAllItem extends StatelessWidget {
  const BuildAllItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: ListTile(
        leading: CachedNetworkImage(
          imageUrl:
              'https://student.valuxapps.com/storage/uploads/products/16387377980g2kx.11.jpg',
          width: 60,
          height: 60,
          fit: BoxFit.cover,
        ),
        title: const Text('product.name'),
        subtitle: const Text('product.description'),
        trailing: const Text("₹ ${15}"),
      ),
    );
  }
}
