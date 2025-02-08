import 'package:e_commerce/features/banners/domain/entites/banner_entity.dart';
import 'package:e_commerce/features/banners/presentation/view/widget/banner_view_body.dart';
import 'package:flutter/material.dart';

class BannerView extends StatelessWidget {
  const BannerView({super.key, required this.data});

  final BannerEntity data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF7F7F9),
      extendBody: true,
      appBar: AppBar(
        title: const Text("العروض والخصومات"),
        centerTitle: true,
      ),
      body: BannerViewBody(data: data),
    );
  }
}
