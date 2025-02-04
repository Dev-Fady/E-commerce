import 'package:e_commerce/features/favorites/presentation/manger/get_favorite_rivvepod.dart';
import 'package:e_commerce/features/favorites/presentation/view/favorites_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritesViewRivepodWork extends ConsumerWidget {
  const FavoritesViewRivepodWork({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites = ref.watch(getFavoritesProvider);
    return favorites.when(
      data: (data) {
        return FavoritesView(
          data: data,
        );
      },
      error: (err, stack) {
        print('Error: $err');
        return Center(
          child: Text('Error: ${err.toString()}'),
        );
      },
      loading: () {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
