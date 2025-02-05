import 'dart:developer';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:e_commerce/core/theme/app_text_styles.dart';
import 'package:e_commerce/core/widget/custom_snackbar.dart';
import 'package:e_commerce/features/cart/presentation/manger/cubit/add_or_delete_cart_cubit.dart';
import 'package:e_commerce/features/cart/presentation/manger/cubit/add_or_delete_cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddToCart extends StatelessWidget {
  const AddToCart({
    super.key,
    required this.id,
  });

  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddOrDeleteCartCubit, AddOrDeleteCartState>(
      listener: (context, state) {
        if (state is AddOrDeleteCartFailure) {
          CustomSnackbar.show(
            context: context,
            title: 'تم بنجاح!',
            message: state.error.message,
            type: ContentType.failure,
          );
        } else if (state is AddOrDeleteCartSuccess) {
          CustomSnackbar.show(
            context: context,
            title: 'تم بنجاح!',
            message: state.cart.message == "Added Successfully"
                ? "تمت الإضافة بنجاح"
                : "تم الحذف بنجاح",
            type: ContentType.success,
          );
          log("******************************${state.cart.message}****************************");
        }
      },
      builder: (context, state) {
        if (state is AddOrDeleteCartLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        return FutureBuilder<bool>(
          future: Future.value(context.read<AddOrDeleteCartCubit>().isCart(id)),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            bool isCart = snapshot.data ?? false;
            return OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                foregroundColor: isCart ? Colors.green : Colors.blue,
                side: BorderSide(color: isCart ? Colors.green : Colors.blue),
              ),
              onPressed: () {
                context.read<AddOrDeleteCartCubit>().addOrRemoveCart(id);
              },
              icon: Icon(
                Icons.shopping_cart,
                color: isCart ? Colors.green : Colors.blue,
              ),
              label: Text(
                isCart ? "تمت  " : "أضف  ",
                style: AppTextStyles.bodyBasaBold16,
              ),
            );
          },
        );
      },
    );
  }
}
