import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garraribikes/blocs/home/home_bloc.dart';
import 'package:garraribikes/constants/Appcolors.dart';
import 'package:garraribikes/screens/account/account.dart';
import 'package:garraribikes/screens/cart/cart.dart';
import 'package:garraribikes/screens/categories/categories.dart';
import 'package:garraribikes/screens/favourites/favourite.dart';
import 'package:garraribikes/screens/home/homePage.dart';
import 'package:garraribikes/screens/settings.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();

    _pages = [
      BlocProvider<HomeBloc>(
        create: (_) => HomeBloc(),
        child: const HomePage(),
      ),
      Categories(), // Categories Page Placeholder
       Cart(), // Cart Page Placeholder
      Favourite(), // Favourite Page Placeholder
      Account(), // Profile Page Placeholder
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        selectedItemColor: Appcolors.appColor,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("assets/images/home.png")),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("assets/images/category.png")),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("assets/images/cart.png")),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("assets/images/favourite.png")),
            label: 'Favourite',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("assets/images/profile.png")),
            label: 'Account'
                '',
          ),
        ],
      ),
    );
  }
}
