import 'dart:developer';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
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
          log("******************************${state.cart.message}****************************}");
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
            return Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: isCart ? Colors.green : Colors.blue,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  context.read<AddOrDeleteCartCubit>().addOrRemoveCart(id);
                },
                child: Text(
                  isCart ? "تمت الإضافة بالفعل" : "أضف إلى السلة",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
