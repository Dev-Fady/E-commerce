import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/DI/dependency_injection.dart';
import 'package:e_commerce/core/helper_functions/router/router_name.dart';
import 'package:e_commerce/core/services/api/api_service.dart';
import 'package:e_commerce/core/theme/app_text_styles.dart';
import 'package:e_commerce/features/favorites/data/repo/favorites_repo_impl.dart';
import 'package:e_commerce/features/favorites/presentation/manger/cubit/add_or_delete_favorites_cubit.dart';
import 'package:e_commerce/features/product_details/view/widget/add_favorite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../domain/entites/categories_details_entity.dart';

class BestSeller extends StatelessWidget {
  const BestSeller({super.key, required this.data});

  final CategoriesDetailsEntity data;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddOrDeleteFavoritesCubit(
        favoritesRepo: FavoritesRepoImpl(
          apiService: getIt<ApiService>(),
        ),
      ),
      child: InkWell(
        onTap: () {
          context.push(RouterName.product_details_view, extra: data);
        },
        child: Container(
          width: 155.w,
          padding: EdgeInsets.all(12.r),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 8,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: CachedNetworkImage(
                  width: double.infinity,
                  height: 120.h,
                  fit: BoxFit.fill,
                  imageUrl: data.image,
                  placeholder: (context, url) =>
                      Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => Image.asset(
                      'assets/images/customer/avatar.png',
                      fit: BoxFit.cover),
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                data.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.bodySmallSemiBold13,
              ),
              SizedBox(height: 4.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$ ${data.price}',
                    style: AppTextStyles.bodyBasaBold16,
                  ),
                  AddFavorite(
                      id: data.id!) // This will now have access to the Cubit
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
