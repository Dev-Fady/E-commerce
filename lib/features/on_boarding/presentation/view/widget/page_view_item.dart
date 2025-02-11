import 'package:e_commerce/core/constants/constanst.dart';
import 'package:e_commerce/core/helper_functions/router/router_name.dart';
import 'package:e_commerce/core/cache/cache_helper.dart';
import 'package:e_commerce/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.visible,
  });
  final bool visible;
  final String subtitle, image;
  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.sizeOf(context).height * 0.55,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Image.asset(image),
              ),
              if (visible)
                Positioned(
                  top: 16.h,
                  right: 16.w,
                  child: GestureDetector(
                    onTap: () async {
                      await CacheHelper()
                          .saveData(key: kIsBoardingViewSeen, value: true);
                      if (context.mounted) {
                        context.goNamed(RouterName.login);
                      }
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'تخط',
                        style: AppTextStyles.bodySmallBold13
                            .copyWith(color: const Color(0xff949D9E)),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
        SizedBox(height: 64.h),
        title,
        SizedBox(height: 24.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            subtitle,
            textAlign: TextAlign.center,
            style: AppTextStyles.bodySmallBold13.copyWith(
              color: const Color(0xff4E5556),
            ),
          ),
        ),
      ],
    );
  }
}
