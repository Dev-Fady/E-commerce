import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/constants/images.dart';
import 'package:e_commerce/core/services/api/token_storage.dart';
import 'package:e_commerce/core/theme/app_text_styles.dart';
import 'package:e_commerce/features/profile/presentation/manger/profile_rivepod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CutsomCategoriesAppBar extends ConsumerWidget {
  const CutsomCategoriesAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getProfileAsync =
        ref.watch(getProfileProvider(TokenStorage().getTokenLogin()));
    return getProfileAsync.when(
      data: (data) {
        return ListTile(
          leading: CachedNetworkImage(
            width: 120.w,
            height: 40.h,
            imageUrl: data.image,
            imageBuilder: (context, imageProvider) => CircleAvatar(
              radius: 15.r,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            placeholder: (context, url) =>
                Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) =>
                Image.asset('assets/images/customer/avatar.png'),
          ),
          title: Text(
            'صباح الخير !..',
            style: AppTextStyles.bodyBasaRegular16
                .copyWith(color: const Color(0xff949D9E)),
          ),
          subtitle: Text(
            data.name,
            style: AppTextStyles.bodyBasaBold16.copyWith(color: Colors.black),
          ),
          trailing: Container(
              width: 34.w,
              height: 34.h,
              decoration: const ShapeDecoration(
                shape: OvalBorder(),
                color: Colors.white,
              ),
              child: SvgPicture.asset(Assets.imageNotification)),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) {
        print('Error: $err');
        return Center(
          child: Text('Error: ${err.toString()}'),
        );
      },
    );
  }
}
