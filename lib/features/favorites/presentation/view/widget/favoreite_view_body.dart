import 'package:e_commerce/features/favorites/domain/entites/get_favorites_entity.dart';
import 'package:e_commerce/features/favorites/presentation/manger/get_favorite_rivvepod.dart';
import 'package:e_commerce/features/favorites/presentation/view/widget/favorite_item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoreiteViewBody extends ConsumerStatefulWidget {
  const FavoreiteViewBody({super.key, required this.data});
  final List<GetFavoritesEntity> data;

  @override
  ConsumerState<FavoreiteViewBody> createState() => _FavoreiteViewBodyState();
}

class _FavoreiteViewBodyState extends ConsumerState<FavoreiteViewBody> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // ignore: unused_result
    ref.refresh(getFavoritesProvider);
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
          );
        },
      ),
    );
  }
}
