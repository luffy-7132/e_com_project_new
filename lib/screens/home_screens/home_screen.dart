import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:e_com_project_new/screens/bottom_nav_pages/cart_page.dart';
import 'package:e_com_project_new/screens/bottom_nav_pages/home_page/home_page.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

enum _SelectedTab { home, favorite, search, person }

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  List<Widget> Pages = [
    Center(child: Text('Setting')),
    Center(child: Text('Likes')),
    Home_page(),
    ImageCarousel(),
    Center(child: Text('Profile Page')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Pages[_selectedIndex],
      ),
      bottomNavigationBar: FlashyTabBar(
        selectedIndex: _selectedIndex,
        animationDuration: Duration(milliseconds: 500),
        showElevation: true,
        onItemSelected: (index) => setState(() {
          _selectedIndex = index;
        }),
        items: [
          FlashyTabBarItem(
            icon: Icon(Iconsax.setting_2_bold),
            title: Text('Settings'),
          ),
          FlashyTabBarItem(
            icon: Icon(Iconsax.heart_bold),
            title: Text('Wishlist'),
          ),
          FlashyTabBarItem(
            icon: Icon(Iconsax.home_1_bold),
            title: Text('Home'),
          ),
          FlashyTabBarItem(
            icon: Icon(Iconsax.shopping_cart_bold),
            title: Text('Cart'),
          ),
          FlashyTabBarItem(
            icon: Icon(Iconsax.personalcard_bold),
            title: Text('Account'),
          ),
        ],
      ),
    );
  }
}
