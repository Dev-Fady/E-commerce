import 'dart:developer';
import 'package:e_commerce/features/favorites/presentation/manger/add_or_delete_favorites_rivepod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final favoriteStatusProvider = StateProvider<bool>((ref) => false);

class AddFavorite extends ConsumerWidget {
  const AddFavorite({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFavorite = ref.watch(favoriteStatusProvider);

    return IconButton(
      onPressed: () async {
        try {
          final newStatus = !isFavorite;
          ref.read(favoriteStatusProvider.notifier).state = newStatus;

          // Call the API to add or remove from favorites
          final result =
              await ref.watch(AddOrDeleteFavoritesProvider(id).future);

          log('********************Favorited: ${result.message}*********************');

          // Show success message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(result.message)),
          );

          // If successful, update the favorite status based on the result
          ref.watch(favoriteStatusProvider.notifier).state = newStatus;
        } catch (e) {
          log('********************Error: ${e.toString()}*********************');

          // Show failure message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to update favorite status')),
          );

          // Revert the favorite status back to its original value if there's an error
          ref.read(favoriteStatusProvider.notifier).state = !isFavorite;
        }
      },
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        size: 32.h,
        color: isFavorite ? Colors.red : null,
      ),
    );
  }
}
