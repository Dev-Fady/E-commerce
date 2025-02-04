import 'package:e_commerce/features/favorites/domain/entites/get_favorites_entity.dart';
import 'package:e_commerce/features/favorites/presentation/view/widget/NoItem.dart';
import 'package:flutter/material.dart';

import 'widget/favoreite_view_body.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key, required this.data});
  final List<GetFavoritesEntity> data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF7F7F9),
      extendBody: true,
      appBar: AppBar(
        title: const Text("Favorites"),
        centerTitle: true,
      ),
      body: data.isEmpty
          ? NoItem()
          : FavoreiteViewBody(data: data),
    );
  }
}
