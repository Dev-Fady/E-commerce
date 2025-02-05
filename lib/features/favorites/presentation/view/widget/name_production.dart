import 'package:e_commerce/features/favorites/domain/entites/get_favorites_entity.dart';
import 'package:flutter/material.dart';

class NameProduction extends StatelessWidget {
  const NameProduction({
    super.key,
    required this.data,
  });

  final GetFavoritesEntity data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        data.name,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        softWrap: true,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
