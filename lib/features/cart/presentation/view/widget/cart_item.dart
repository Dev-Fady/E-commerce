import 'package:e_commerce/core/DI/dependency_injection.dart';
import 'package:e_commerce/core/services/api/api_service.dart';
import 'package:e_commerce/features/cart/data/repo/cart_repo_impl.dart';
import 'package:e_commerce/features/cart/domain/entites/get_carts_entity.dart';
import 'package:e_commerce/features/cart/presentation/manger/cubit/delete_cart_cubit.dart';
import 'package:e_commerce/features/cart/presentation/manger/cubit/updata_cart_cubit.dart';
import 'package:e_commerce/features/cart/presentation/view/widget/delete_cart.dart';
import 'package:e_commerce/features/cart/presentation/view/widget/image_protuction.dart';
import 'package:e_commerce/features/cart/presentation/view/widget/name_prodcution.dart';
import 'package:e_commerce/features/cart/presentation/view/widget/price_protuction.dart';
import 'package:e_commerce/features/cart/presentation/view/widget/quantity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.data,
  });
  final GetCartsEntity data;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DeleteCartCubit(
            cartRepo: CartRepoImpl(
              apiService: getIt<ApiService>(),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => UpdataCartCubit(
            cartRepo: CartRepoImpl(
              apiService: getIt<ApiService>(),
            ),
          ),
        ),
      ],
      child: Card(
        margin: const EdgeInsets.only(bottom: 16.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              ImageProtuction(data: data),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NameProdcution(name: data.name),
                    const SizedBox(height: 4),
                    PriceProtuction(price: data.price),
                    const SizedBox(height: 8),
                    Quantity(data: data),
                  ],
                ),
              ),
              DeleteCart(data: data),
            ],
          ),
        ),
      ),
    );
  }
}
