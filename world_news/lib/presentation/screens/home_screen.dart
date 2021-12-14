import 'package:flutter/material.dart';
import '../../helper/colors_manager.dart';
import '../../helper/constants.dart';
import '../../helper/string_manager.dart';
import 'category_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController =
        TabController(length: ConstantsManager.categories.length, vsync: this);
  }

  getTab(int index) {
    return Tab(
      text: ConstantsManager.categories[index].toUpperCase(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringManager.title),
        bottom: TabBar(
          indicatorColor: ColorsManager.seletedColor,
          controller: tabController,
          indicatorSize: TabBarIndicatorSize.label,
          isScrollable: true,
          tabs: [
            for (int i = 0; i < ConstantsManager.categories.length; i++)
              getTab(i),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          for (var i = 0; i < ConstantsManager.categories.length; i++)
            CategoryScreen(
              index: i,
              title: ConstantsManager.categories[i].toUpperCase(),
            ),
        ],
      ),
    );
  }
}
