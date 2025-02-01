// import 'package:e_commerce/core/cubit/products/products_cubit.dart';
// import 'package:e_commerce/features/home/presentation/view/productis_screen/widget/Sliver_app_bar_delegate.dart';
// import 'package:e_commerce/features/home/presentation/view/productis_screen/widget/best_selling_grid_view.dart';
// import 'package:e_commerce/features/home/presentation/view/productis_screen/widget/best_selling_header.dart';
// import 'package:e_commerce/features/home/presentation/view/productis_screen/widget/custom_search.dart';
// import 'package:e_commerce/features/home/presentation/view/productis_screen/widget/cutsom_categories_app_bar.dart';
// import 'package:e_commerce/features/home/presentation/view/productis_screen/widget/featured_item_list.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class HomeViewBody extends StatefulWidget {
//   const HomeViewBody({super.key});

//   @override
//   State<HomeViewBody> createState() => _HomeViewBodyState();
// }

// class _HomeViewBodyState extends State<HomeViewBody> {
//   @override
//   void initState() {
//     super.initState();
//     context.read<ProductsCubit>().getBestSellingProducts();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<ProductsCubit, ProductsState>(
//       builder: (context, state) {
//         if (state is ProductsSuccess) {
//           return CustomScrollView(
//             slivers: [
//               SliverToBoxAdapter(
//                 child: Column(
//                   children: [
//                     SizedBox(height: 16.h),
//                      CutsomHomeAppBar(),
//                     SizedBox(height: 16.h),
//                     const CustomSearch(),
//                     SizedBox(height: 12.h),
//                     const FeaturedItemList(),
//                     SizedBox(height: 12.h),
//                   ],
//                 ),
//               ),
//               SliverPersistentHeader(
//                 pinned: true,
//                 delegate: SliverAppBarDelegate(
//                   child: BestSellingHeader(),
//                 ),
//               ),
//               SliverToBoxAdapter(
//                 child: SizedBox(height: 16.h),
//               ),
//               BestSellingGridView(),
//             ],
//           );
//         } 
//         else if (state is ProductsLoading) {
//             return Center(child: CircularProgressIndicator());
//           } else {
//             return Center(child: Text('Error loading products'));
//           }
//       },
//     );
//   }
// }
