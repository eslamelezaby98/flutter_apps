import 'package:e_commerce_fluter_app/data/data_provider/main_screen_provider.dart';
import 'package:e_commerce_fluter_app/helper/color_manager.dart';
import 'package:e_commerce_fluter_app/views/cart_screen/cart_screen.dart';
import 'package:e_commerce_fluter_app/views/home_screen/home_screen.dart';
import 'package:e_commerce_fluter_app/views/home_screen/my_drawer.dart';
import 'package:e_commerce_fluter_app/views/search_screen/search_screen.dart';
import 'package:e_commerce_fluter_app/views/user_profile_screen/user_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final List<Widget> _screens = const [
    HomeScreen(),
    SearchScreen(),
    CartScreen(),
    UserProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const MyDrawer(),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: ColorManager.secondColor,
          unselectedItemColor: Colors.black,
          currentIndex: _currentIndex,
          onTap: (value) {
            setState(() {
              _currentIndex = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined),
              label: '',
            ),
          ],
        ),
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Image(
                fit: BoxFit.cover,
                image: NetworkImage(
                  'https://preview.keenthemes.com/metronic-v4/theme_rtl/assets/pages/media/profile/profile_user.jpg',
                ),
              ),
            ),
          ],
        ),
        body: _screens.elementAt(_currentIndex),
      ),
    );
  }
}
