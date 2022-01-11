import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive/app_manager/color_manager.dart';
import 'package:flutter_facebook_responsive/views/screens/home_screen/widget/circle_button.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: CustomScrollView(
        slivers: [
          //? app bar
          SliverAppBar(
            floating: true,
            backgroundColor: Colors.white,
            centerTitle: false,
            title:const Text(
              'facebook',
              style: TextStyle(
                color: ColorManager.facebookBlue,
                wordSpacing: -1.5,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              CircleButton(
                icon: Icons.search,
                onPress: () {},
              ),
              CircleButton(
                icon: MdiIcons.facebookMessenger,
                onPress: () {},
              ),
            ],
          ),

          //? create post.
          SliverToBoxAdapter(
            child: Container(
              height: 100,
              color: Colors.yellow,
            ),
          ),
        ],
      ),
    );
  }
}


