import 'package:e_commerce/features/favorites/domain/entites/get_favorites_entity.dart';
import 'package:e_commerce/features/favorites/presentation/view/widget/NoItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../manger/get_favorite_rivvepod.dart';
import 'widget/favoreite_view_body.dart';

class FavoritesView extends ConsumerStatefulWidget {
  const FavoritesView({super.key, required this.data});
  final List<GetFavoritesEntity> data;

  @override
  ConsumerState<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends ConsumerState<FavoritesView> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    Future.microtask(() {
      // ignore: unused_result
      ref.refresh(getFavoritesProvider);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF7F7F9),
      extendBody: true,
      appBar: AppBar(
        title: const Text("المفضلة"),
        centerTitle: true,
      ),
      body: widget.data.isEmpty
          ? NoItem(text: "No favorites yet!")
          : FavoreiteViewBody(data: widget.data),
    );
  }
}
