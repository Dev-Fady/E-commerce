import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/DI/dependency_injection.dart';
import 'package:e_commerce/core/helper_functions/router/router_name.dart';
import 'package:e_commerce/core/services/api/api_service.dart';
import 'package:e_commerce/features/favorites/presentation/manger/cubit/add_or_delete_favorites_cubit.dart';
import 'package:e_commerce/features/home/domain/entites/categories_details_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../favorites/data/repo/favorites_repo_impl.dart';
import '../../../../../product_details/view/widget/add_favorite.dart';

class BuildAllItem extends StatelessWidget {
  const BuildAllItem({super.key, required this.data});
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
          log(data.oldPrice.toString());
        },
        child: Card.outlined(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Padding(
              padding: EdgeInsets.all(12.w),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12.r),
                      bottomLeft: Radius.circular(12.r),
                    ),
                    child: CachedNetworkImage(
                      width: 70.w,
                      height: 70.h,
                      fit: BoxFit.cover,
                      imageUrl: data.image,
                      placeholder: (context, url) =>
                          Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) => Image.asset(
                          'assets/images/customer/avatar.png',
                          fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          data.description,
                          style: TextStyle(
                              color: Colors.grey[600], fontSize: 14.sp),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          "L.E ${data.price}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  AddFavorite(id: data.id!) // Now has access to the Cubit
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
