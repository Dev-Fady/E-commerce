import 'package:e_commerce/features/banners/presentation/manger/banner_rivepod.dart';
import 'package:e_commerce/features/banners/presentation/view/banner_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BannerViewRivepodWork extends ConsumerWidget {
  const BannerViewRivepodWork({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final carts = ref.watch(getBannerProvider);
    return carts.when(
      data: (data) {
        return BannerView(
          data: data,
        );
      },
      error: (err, stack) {
        print('Error: $err');
        return Center(
          child: Text('Error: ${err.toString()}'),
        );
      },
      loading: () {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
