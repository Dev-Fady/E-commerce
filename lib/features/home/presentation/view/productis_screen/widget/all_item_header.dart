// import 'package:e_commerce/core/helper_functions/router/router_name.dart';
import 'package:e_commerce/core/theme/app_colors.dart';
import 'package:e_commerce/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/helper_functions/router/router_name.dart';
import '../../../../domain/entites/categories_details_entity.dart';
// import 'package:go_router/go_router.dart';

class AllItemHeader extends StatelessWidget {
  const AllItemHeader({super.key, required this.data});

  final List<CategoriesDetailsEntity> data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(RouterName.all_productis, extra: data);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Text(
              '  جميع المنتاجات',
              style: AppTextStyles.bodyBasaBold16.copyWith(color: Colors.black),
            ),
            Spacer(),
            Text(
              'المزيد',
              style: AppTextStyles.bodySmallBold13.copyWith(
                color: AppColors.grayscale400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
