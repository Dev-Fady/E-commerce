import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/constants/images.dart';
import 'package:e_commerce/core/theme/app_text_styles.dart';
import 'package:e_commerce/core/widget/cusstom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg;

import '../../../../domain/entites/categories_details_entity.dart';

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({super.key, required this.data});

  final CategoriesDetailsEntity data;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.r),
      child: Container(
        width: size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: AspectRatio(
          aspectRatio: 342 / 165,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                bottom: 0,
                top: 0,
                right: size.width * 0.4,
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: data.image,
                  placeholder: (context, url) =>
                      Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => Image.asset(
                      'assets/images/customer/avatar.png',
                      fit: BoxFit.cover),
                ),
              ),
              Container(
                width: size.width * 0.5,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: svg.Svg(Assets.imageFeaturedItemBackground),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'عروض العيد',
                      style: AppTextStyles.bodySmallRegular13
                          .copyWith(color: Colors.white),
                    ),
                    Text(
                      'خصم ${data.discount}%',
                      style: AppTextStyles.bodyLargeBold19.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    CusstomButton(
                      buttonText: 'تسوق الان',
                      buttonHeight: 32.h,
                      buttonWidth: 95.w,
                      backgroundColor: Colors.white,
                      textStyle: AppTextStyles.bodySmallBold13,
                      onPressed: () {},
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
