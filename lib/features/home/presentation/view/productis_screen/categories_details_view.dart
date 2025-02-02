import 'package:flutter/material.dart';
import '../../../domain/entites/categories_details_entity.dart';
import 'widget/CategoriesDatailsViewBody.dart';

class CategoriesDetailsView extends StatelessWidget {
  final List<CategoriesDetailsEntity> data;
  const CategoriesDetailsView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("المنتجات"),
        centerTitle: true,
      ),
      body: CategoriesDatailsViewBody(
        data: data,
      ),
    );
  }
}
