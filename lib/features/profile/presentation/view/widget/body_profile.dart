import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/features/profile/domian/entites/profile_entity.dart';
import 'package:e_commerce/features/profile/presentation/view/widget/logout_button.dart';
import 'package:e_commerce/features/profile/presentation/view/widget/payment_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_text_styles.dart';
import 'build_list_tile.dart';
import 'credit_and_points.dart';

class BodyProfile extends StatelessWidget {
  const BodyProfile({
    super.key,
    required this.profileEntity,
  });

  final ProfileEntity profileEntity;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 20.h),
          // Profile Picture
          CachedNetworkImage(
            width: 163.w,
            height: 110.h,
            imageUrl:
                'https://jjfnqrvkebweapmofqtn.supabase.co/storage/v1/object/public/${profileEntity.image}',
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) =>
                Image.asset('assets/images/customer/avatar.png'),
          ),
          SizedBox(height: 20.h),
          // Name
          Text(profileEntity.name, style: AppTextStyles.heading23Bold),
          SizedBox(height: 8.h),
          // Email
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              profileEntity.email,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: CupertinoColors.systemGrey,
              ),
            ),
          ),
          SizedBox(height: 20.h),
          // Stats Row
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CreditAndPoints(
                    label: 'النقاط', value: profileEntity.points.toString()),
                CreditAndPoints(label: 'الرصيد', value: '50'),
              ],
            ),
          ),
          SizedBox(height: 30.h),
          // Payment Button
          PaymentButton(),
          const SizedBox(height: 30),
          // Options List
          const Column(
            children: [
              BuildListTile(icon: CupertinoIcons.settings, title: 'الإعدادات'),
              BuildListTile(icon: CupertinoIcons.chat_bubble, title: 'الرسائل'),
              BuildListTile(icon: CupertinoIcons.heart, title: 'النشاط'),
              BuildListTile(icon: CupertinoIcons.bookmark, title: 'المحفوظات'),
              BuildListTile(icon: CupertinoIcons.bell, title: 'الإشعارات'),
              BuildListTile(
                  icon: CupertinoIcons.question_circle, title: 'المساعدة')
            ],
          ),
          SizedBox(height: 15.h),
          // Logout Button
          LogoutButton(),
        ],
      ),
    );
  }
}
