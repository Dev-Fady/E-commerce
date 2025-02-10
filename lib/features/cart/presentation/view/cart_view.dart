import 'package:e_commerce/core/DI/dependency_injection.dart';
import 'package:e_commerce/core/services/api/api_service.dart';
import 'package:e_commerce/features/cart/domain/entites/get_carts_entity.dart';
import 'package:e_commerce/features/favorites/presentation/view/widget/NoItem.dart';
import 'package:e_commerce/features/orders/data/repo/orders_repo_impl.dart';
import 'package:e_commerce/features/orders/presentation/manger/cubit/add_order_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../manger/get_cart_rivepod.dart';
import 'widget/cart_view_body.dart';
import 'widget/cart_view_botton_navigation_bar.dart';

class CartView extends ConsumerStatefulWidget {
  const CartView({super.key, required this.data});
  final List<GetCartsEntity> data;

  @override
  ConsumerState<CartView> createState() => _CartViewState();
}

class _CartViewState extends ConsumerState<CartView> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    Future.microtask(() {
      // ignore: unused_result
      ref.refresh(getCartProvider);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AddOrderCubit(
            ordersRepo: OrdersRepoImpl(
              apiService: getIt<ApiService>(),
            ),
          ),
        ),
      ],
      child: Scaffold(
        backgroundColor: Color(0xffF7F7F9),
        extendBody: true,
        appBar: AppBar(
          title: const Text(
            'سلة المشتريات',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: widget.data.isEmpty
            ? NoItem(text: 'No Carts yet!')
            : CartViewBody(
                data: widget.data,
              ),
        bottomNavigationBar: widget.data.isNotEmpty
            ? CartViewBottonNavigationBar(
                data: widget.data[0],
              )
            : null,
      ),
    );
  }
}
