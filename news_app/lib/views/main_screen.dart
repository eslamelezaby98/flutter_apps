import 'package:flutter/material.dart';
import 'package:news_app/app_manager/color_manager.dart';
import 'package:news_app/app_manager/strings_manager.dart';
import 'package:news_app/views/all_news_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  late TabController tabController;
  List<Widget> tabs = [
    const AllNewsScreen(),
  ];

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          StringsManager.logoName,
        ),
        bottom: TabBar(
          controller: tabController,
          indicatorColor: ColorManager.darkPrimary,
          tabs: const [
            Tab(
              text: 'All news',
            ),
            Tab(
              text: 'Buisness',
            ),
            Tab(
              text: 'Tech',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: const [
          AllNewsScreen(),
          Center(
            child: Text("It's rainy here"),
          ),
          Center(
            child: Text("It's sunny here"),
          ),
        ],
      ),
    );
  }
}
