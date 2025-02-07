import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:e_commerce/core/widget/custom_snackbar.dart';
import 'package:e_commerce/features/cart/domain/entites/get_carts_entity.dart';
import 'package:e_commerce/features/cart/presentation/manger/cubit/delete_cart_cubit.dart';
import 'package:e_commerce/features/cart/presentation/manger/cubit/delete_cart_state.dart';
import 'package:e_commerce/features/cart/presentation/manger/get_cart_rivepod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DeleteCart extends ConsumerWidget {
  const DeleteCart({super.key, required this.data});

  final GetCartsEntity data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BlocConsumer<DeleteCartCubit, DeleteCartState>(
      listener: (context, state) {
        if (state is DeleteCartFailure) {
          CustomSnackbar.show(
            context: context,
            title: 'تم بنجاح!',
            message: state.error.message,
            type: ContentType.failure,
          );
        } else if (state is DeleteCartSuccess) {
          CustomSnackbar.show(
            context: context,
            title: 'تم بنجاح!',
            message: state.Cart.message,
            type: ContentType.success,
          );
          ref.invalidate(getCartRepoProvider);
        }
      },
      builder: (context, state) {
        if (state is DeleteCartLoading) {
          return Center(child: CircularProgressIndicator());
        }
        return IconButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: () async {
            await context.read<DeleteCartCubit>().deleteFavorite(data.mainId);
          },
        );
      },
    );
  }
}
