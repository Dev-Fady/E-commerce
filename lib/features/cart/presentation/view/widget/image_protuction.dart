import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../domain/entites/get_carts_entity.dart';

class ImageProtuction extends StatelessWidget {
  const ImageProtuction({
    super.key, required this.data,
  });
    final GetCartsEntity data;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.h,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.r),
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          width: 80,
          imageUrl: data.image,
          placeholder: (context, url) =>
              const Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) => Image.asset(
              'assets/images/customer/avatar.png',
              fit: BoxFit.cover),
        ),
      ),
    );
  }
}
