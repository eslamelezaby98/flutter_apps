import 'package:flutter/material.dart';
import 'package:fltter_e_commerce_app/screens/cart_screen.dart';
import 'package:fltter_e_commerce_app/screens/home_screen.dart';
import 'package:fltter_e_commerce_app/screens/user_profile_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Widget> screens = <Widget>[
    HomeScreen(),
    CartScreen(),
    UserProfile()
  ];

 int _currentIndex = 0;
 

  onTap(index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xff0B1423),
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.white70,
        onTap: onTap,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: '',
          ),
        ],
      ),
      body: screens.elementAt(_currentIndex),
    );
  }
}
