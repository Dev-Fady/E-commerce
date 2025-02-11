import 'package:e_commerce/core/theme/app_text_styles.dart';
import 'package:e_commerce/features/on_boarding/presentation/view/widget/title_text_page_one.dart';
import 'package:flutter/material.dart';

import 'page_view_item.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({
    super.key,
    required this.controller,
  });
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
      children: [
        const PageViewItem(
          visible: true,
          title: TitleTextPageOne(),
          subtitle:
              'كل ما تحتاجه في مكان واحد! تسوّق الفواكه الطازجة، الملابس العصرية، مستلزمات البقالة، والأجهزة الكهربائية بأفضل العروض والتوصيل السريع.',
          image: 'assets/on_borading/onborading_one.png',
        ),
        PageViewItem(
          visible: false,
          title: Text(
            'ابحث وتسوق',
            style: AppTextStyles.heading23Bold,
          ),
          subtitle:
              'تسوّق بسهولة من مجموعة واسعة من المنتجات، بدءًا من الفواكه الطازجة إلى الملابس والأجهزة الكهربائية. اطلع على التفاصيل والتقييمات قبل الشراء!',
          image: 'assets/on_borading/onborading_two.png',
        )
      ],
    );
  }
}
