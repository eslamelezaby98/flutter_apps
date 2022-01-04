import 'package:flutter/material.dart';
//TODO: build drawer
class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    return  Drawer(
      backgroundColor: Colors.black,
      child: ListView(),
    );
  }
}
