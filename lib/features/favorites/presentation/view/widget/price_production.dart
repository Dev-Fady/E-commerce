import 'package:e_commerce/features/favorites/domain/entites/get_favorites_entity.dart';
import 'package:flutter/material.dart';

class PriceProduction extends StatelessWidget {
  const PriceProduction({
    super.key,
    required this.data,
  });

  final GetFavoritesEntity data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child:
          Text("L.E ${data.price}", style: const TextStyle(color: Colors.grey)),
    );
  }
}