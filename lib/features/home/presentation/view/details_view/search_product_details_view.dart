import 'dart:developer';
import 'package:e_commerce/features/home/domain/entites/product_search_entity.dart';
import 'package:e_commerce/features/product_details/view/widget/add_favorite.dart';
import 'package:e_commerce/features/product_details/view/widget/add_to_cart.dart';
import 'package:e_commerce/features/product_details/view/widget/list_images.dart';
import 'package:e_commerce/features/product_details/view/widget/list_view_images.dart';
import 'package:e_commerce/features/product_details/view/widget/price.dart';
import 'package:e_commerce/features/product_details/view/widget/widget_dot.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'widget/app_bar_product_details.dart';
import 'widget/expandable_text.dart';

class SearchProductDetailsView extends StatefulWidget {
  const SearchProductDetailsView({
    super.key,
    required this.data,
  });
  final DataItemEntity data;

  @override
  _SearchProductDetailsViewState createState() =>
      _SearchProductDetailsViewState();
}

class _SearchProductDetailsViewState extends State<SearchProductDetailsView> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    log("***************************************${widget.data}");
    return Scaffold(
      appBar: AppBarProductDetails(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    ListImages(
                        images: widget.data.images!,
                        onIndexChanged: (index) {
                          setState(() {
                            currentIndex = index;
                          });
                        }),
                    const SizedBox(height: 10),
                    widgetDot(
                        images: widget.data.images!, currentIndex: currentIndex),
                    const SizedBox(height: 20),
                    Text(
                      widget.data.name!,
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Price(price: widget.data.price!.toInt()),
                    const SizedBox(height: 10),
                    ListViewImages(images: widget.data.images!),
                    const SizedBox(height: 10),
                    ExpandableText(text: widget.data.description!),
                    const SizedBox(height: 20),
                    Row(
                      spacing: 25.w,
                      children: [
                        AddFavorite(
                          id: widget.data.id!,
                        ),
                        AddToCart(
                          id: widget.data.id!,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
