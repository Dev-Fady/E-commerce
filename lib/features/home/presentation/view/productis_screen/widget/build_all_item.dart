import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/features/home/domain/entites/categories_details_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildAllItem extends StatelessWidget {
  const BuildAllItem({super.key, required this.data});
  final CategoriesDetailsEntity data;

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      child: Container(
        decoration: BoxDecoration(
          // color: Colors.white,
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
                      style:
                          TextStyle(color: Colors.grey[600], fontSize: 14.sp),
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
              Icon(Icons.favorite_border, size: 24.sp),
            ],
          ),
        ),
      ),
    );
  }
}
