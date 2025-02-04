import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:e_commerce/core/widget/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remixicon/remixicon.dart';
import '../../../favorites/presentation/manger/cubit/add_or_delete_favorites_cubit.dart';

class AddFavorite extends StatelessWidget {
  const AddFavorite({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddOrDeleteFavoritesCubit, AddOrDeleteFavoritesState>(
      listener: (context, state) {
        if (state is AddOrDeleteFavoritesFailure) {
          CustomSnackbar.show(
            context: context,
            title: 'تم بنجاح!',
            message: state.error.message,
            type: ContentType.failure,
          );
        } else if (state is AddOrDeleteFavoritesSuccess) {
          CustomSnackbar.show(
            context: context,
            title: 'تم بنجاح!',
            message: state.favorite.message,
            type: ContentType.success,
          );
        }
      },
      builder: (context, state) {
        if (state is AddOrDeleteFavoritesLoading) {
          return Center(child: CircularProgressIndicator());
        }

        return FutureBuilder<bool>(
          future: Future.value(
              context.read<AddOrDeleteFavoritesCubit>().isFavorite(id)),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            bool isFavorite = snapshot.data ?? false;

            return IconButton(
              onPressed: () async {
                await context
                    .read<AddOrDeleteFavoritesCubit>()
                    .addOrRemoveFavorite(id);
              },
              icon: Icon(
                isFavorite ? Remix.heart_fill : Remix.heart_3_line,
                size: 32.h,
                color:
                    isFavorite ? Colors.red : Colors.grey, // red when favorite
              ),
            );
          },
        );
      },
    );
  }
}
