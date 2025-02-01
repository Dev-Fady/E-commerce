import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:remixicon/remixicon.dart';

class BestSeller extends StatelessWidget {
  const BestSeller({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
              imageUrl:
                  'https://student.valuxapps.com/storage/uploads/products/1615442168bVx52.item_XXL_36581132_143760083.jpeg',
              placeholder: (context, url) =>
                  Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Image.asset(
                  'assets/images/customer/avatar.png',
                  fit: BoxFit.cover),
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'Headphones',
            style: AppTextStyles.bodySmallSemiBold13,
          ),
          SizedBox(height: 4.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$ 4099',
                style: AppTextStyles.bodyBasaBold16,
              ),
              IconButton(
                icon: const Icon(Remix.heart_3_line),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
