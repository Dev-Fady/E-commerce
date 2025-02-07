import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:e_commerce/core/widget/custom_snackbar.dart';
import 'package:e_commerce/features/cart/domain/entites/get_carts_entity.dart';
import 'package:e_commerce/features/cart/presentation/manger/cubit/updata_cart_cubit.dart';
import 'package:e_commerce/features/cart/presentation/manger/cubit/updata_cart_state.dart';
import 'package:e_commerce/features/cart/presentation/manger/get_cart_rivepod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Quantity extends ConsumerStatefulWidget {
  const Quantity({super.key, required this.data});
  final GetCartsEntity data;

  @override
  ConsumerState<Quantity> createState() => _QuantityState();
}

class _QuantityState extends ConsumerState<Quantity> {
  late int quantity;

  @override
  void initState() {
    super.initState();
    quantity = widget.data.quantity;
  }

  void increaseQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decreaseQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdataCartCubit, UpdataCartState>(
      listener: (context, state) {
        if (state is UpdataCartFailure) {
          CustomSnackbar.show(
            context: context,
            title: 'تم بنجاح!',
            message: state.error.message,
            type: ContentType.failure,
          );
        } else if (state is UpdataCartSuccess) {
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
        return Row(
          children: [
            IconButton(
              icon: const Icon(Icons.remove_circle, color: Colors.red),
              onPressed: decreaseQuantity, // Handle decrease quantity
            ),
            Text(quantity.toString(),
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            IconButton(
              icon: const Icon(Icons.add_circle, color: Colors.green),
              onPressed: increaseQuantity, // Handle increase quantity
            ),
            const Spacer(),
            const SizedBox(width: 8),
            TextButton(
              onPressed: () {
                context
                    .read<UpdataCartCubit>()
                    .updataCart(widget.data.mainId, quantity);
              },
              child: state is UpdataCartLoading
                  ? Center(child: CircularProgressIndicator())
                  : const Text('تأكيد',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            )
          ],
        );
      },
    );
  }
}
