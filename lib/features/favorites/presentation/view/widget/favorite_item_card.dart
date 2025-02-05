import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/DI/dependency_injection.dart';
import 'package:e_commerce/core/services/api/api_service.dart';
import 'package:e_commerce/features/cart/data/repo/cart_repo_impl.dart';
import 'package:e_commerce/features/cart/presentation/manger/cubit/add_or_delete_cart_cubit.dart';
import 'package:e_commerce/features/favorites/data/repo/favorites_repo_impl.dart';
import 'package:e_commerce/features/favorites/domain/entites/get_favorites_entity.dart';
import 'package:e_commerce/features/favorites/presentation/manger/cubit/delete_favorite_cubit.dart';
import 'package:e_commerce/features/favorites/presentation/view/widget/add_to_cart.dart';
import 'package:e_commerce/features/favorites/presentation/view/widget/delete_favorite.dart';
import 'package:e_commerce/features/favorites/presentation/view/widget/name_production.dart';
import 'package:e_commerce/features/favorites/presentation/view/widget/price_production.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoriteItemCard extends StatelessWidget {
  const FavoriteItemCard({super.key, required this.data});
  final GetFavoritesEntity data;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DeleteFavoriteCubit(
              favoritesRepo:
                  FavoritesRepoImpl(apiService: getIt<ApiService>())),
        ),
        BlocProvider(
          create: (context) => AddOrDeleteCartCubit(
              cartRepo: CartRepoImpl(apiService: getIt<ApiService>())),
        ),
      ],
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
              child: Hero(
                tag: data.name,
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 150.h,
                  imageUrl: data.image,
                  placeholder: (context, url) =>
                      Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => Image.asset(
                      'assets/images/customer/avatar.png',
                      fit: BoxFit.cover),
                ),
              ),
            ),
            NameProduction(data: data),
            PriceProduction(data: data),
            SizedBox(height: 8.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    DeleteFavorite(product: data),
                    AddToCart(id: data.productId),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
