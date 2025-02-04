import 'package:e_commerce/features/favorites/domain/entites/get_favorites_entity.dart';
import 'package:e_commerce/features/favorites/presentation/view/widget/favorite_item_card.dart';
import 'package:flutter/material.dart';

class FavoreiteViewBody extends StatefulWidget {
  const FavoreiteViewBody({
    super.key,
    required this.data,
  });

  final List<GetFavoritesEntity> data;
  @override
  State<FavoreiteViewBody> createState() => _FavoreiteViewBodyState();
}

class _FavoreiteViewBodyState extends State<FavoreiteViewBody> {
  void removeFromFavorites(int index) {
    setState(() {
      // widget.favoriteItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
        itemCount: widget.data.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.59,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemBuilder: (context, index) {
          return FavoriteItemCard(
            data: widget.data[index],
            onRemove: () => removeFromFavorites(index),
          );
        },
      ),
    );
  }
}
