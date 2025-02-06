import 'package:e_commerce/features/cart/domain/entites/get_carts_entity.dart';
import 'package:e_commerce/features/cart/presentation/manger/get_cart_rivepod.dart';
import 'package:e_commerce/features/cart/presentation/view/widget/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartViewBody extends ConsumerStatefulWidget {
  const CartViewBody({
    super.key,
    required this.data,
  });

  final List<GetCartsEntity> data;

  @override
  ConsumerState<CartViewBody> createState() => _CartViewBodyState();
}

class _CartViewBodyState extends ConsumerState<CartViewBody> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // ignore: unused_result
    ref.refresh(getCartProvider);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: widget.data.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            CartItem(data: widget.data[index]),
            if (index == widget.data.length - 1) SizedBox(height: 75.h),
          ],
        );
      },
    );
  }
}
