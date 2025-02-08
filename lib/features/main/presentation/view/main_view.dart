import 'package:e_commerce/features/banners/presentation/view/banner_view_rivepod_work.dart';
import 'package:e_commerce/features/cart/presentation/view/cart_view_rivepod_work.dart';
import 'package:e_commerce/features/favorites/presentation/view/favorites_view_rivepod_work.dart';
import 'package:e_commerce/features/home/presentation/view/home_view.dart';
import 'package:e_commerce/features/main/presentation/widgets/custom_bottom_nav_bar.dart';
import 'package:e_commerce/features/profile/presentation/view/perfile_view.dart';
import 'package:flutter/material.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeView(),
    const FavoritesViewRivepodWork(),
    const CartViewRivepodWork(),
    const BannerViewRivepodWork(),
    const PerfileView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F7F9),
      extendBody: true,
      body: SafeArea(
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        shape: const CircleBorder(),
        onPressed: () {
          setState(() {
            _selectedIndex = 2;
          });
        },
        child: const Icon(Icons.shopping_bag, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
