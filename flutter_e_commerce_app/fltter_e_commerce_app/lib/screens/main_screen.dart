import 'package:fltter_e_commerce_app/services/main_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // var mainProvider = Provider.of<MainProvider>(context, listen: false);
    return ChangeNotifierProvider(
      create: (BuildContext context) => MainProvider(),
      child: Consumer<MainProvider>(
        builder: (BuildContext context, value, Widget? child) => Scaffold(
          appBar: AppBar(
            title: Container(
              height: 50,
              child: TextField(
                style: TextStyle(
                  color: ThemeData().hintColor,
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  hintText: 'Search about what you want',
                  prefixIcon: Icon(
                    Icons.search,
                  ),
                ),
              ),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Color(0xff0B1423),
            unselectedItemColor: Colors.white,
            selectedItemColor: Colors.white70,
            onTap: value.onTap,
            currentIndex: value.cureentIndex,
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
              BottomNavigationBarItem(
                icon: Icon(Icons.menu),
                label: '',
              ),
             
              
            ],
          ),
          body: value.screens.elementAt(value.cureentIndex),
        ),
      ),
    );
  }
}
