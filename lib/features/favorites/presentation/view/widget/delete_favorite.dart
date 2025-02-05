import 'package:e_commerce/features/favorites/domain/entites/get_favorites_entity.dart';
import 'package:e_commerce/features/favorites/presentation/manger/cubit/delete_favorite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:e_commerce/features/favorites/presentation/manger/get_favorite_rivvepod.dart';
import 'package:e_commerce/core/widget/custom_snackbar.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class DeleteFavorite extends ConsumerWidget {
  const DeleteFavorite({
    super.key,
    required this.product,
  });
  final GetFavoritesEntity product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BlocConsumer<DeleteFavoriteCubit, DeleteFavoriteState>(
      listener: (context, state) {
        if (state is DeleteFavoriteFailure) {
          CustomSnackbar.show(
            context: context,
            title: 'تم بنجاح!',
            message: state.error.message,
            type: ContentType.failure,
          );
        } else if (state is DeleteFavoriteSuccess) {
          CustomSnackbar.show(
            context: context,
            title: 'تم بنجاح!',
            message: state.favorite.message,
            type: ContentType.success,
          );
          ref.invalidate(getFavoriteRepoProvider);
        }
      },
      builder: (context, state) {
        if (state is DeleteFavoriteLoading) {
          return Center(child: CircularProgressIndicator());
        }
        return IconButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: () async {
            await context
                .read<DeleteFavoriteCubit>()
                .deleteFavorite(product.mainId);
          },
        );
      },
    );
  }
}