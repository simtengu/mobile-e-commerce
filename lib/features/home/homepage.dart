import 'package:e_commerce_app/config/theme.dart';
import 'package:e_commerce_app/core/utils/commonWidgets/horizontal_spacing.dart';
import 'package:e_commerce_app/core/utils/commonWidgets/texts.dart';
import 'package:e_commerce_app/features/cart/presentation/screens/cart.dart';
import 'package:e_commerce_app/features/products/presentation/screens/products_feed.dart';
import 'package:e_commerce_app/features/products/presentation/screens/products_filter.dart';
import 'package:e_commerce_app/features/products/presentation/screens/products_wishlist.dart';
import 'package:e_commerce_app/features/userProfile/presentation/screens/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int activeScreenIndex = 0;
  final List<Widget> _tabs = const <Widget>[
     ProductsFeedScreen(),
     ProductsFilterScreen(),
     CartScreen(),
     ProductsWishlistScreen(),
     UserProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              Icon(
                Icons.shopping_bag,
                color: Pallete.primaryDark,
              ),
              heading3('Shoes',
                  customStyle: const TextStyle(fontWeight: FontWeight.w800))
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.shopping_cart_outlined),
            ),
            hSpacing(14)
          ],
        ),
        body: _tabs[activeScreenIndex],
        bottomNavigationBar: Builder(builder: (context) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.white,
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: Pallete.primary.withOpacity(.7),
              color: Pallete.primary,
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.tune,
                  text: 'Filters',
                ),
                GButton(
                  icon: Icons.shopping_cart,
                  text: 'Cart',
                ),
                GButton(
                  icon: Icons.favorite,
                  text: 'Wishlist',
                ),
                GButton(
                  icon: Icons.account_circle,
                  text: 'Profile',
                ),
              ],
              selectedIndex: activeScreenIndex,
              onTabChange: (index) {
                setState(() {
                  activeScreenIndex = index;
                });
              },
            ),
          );
        }),
      ),
    );
  }
}
