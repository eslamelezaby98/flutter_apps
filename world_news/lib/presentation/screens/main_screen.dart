import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_news/business_logic/cubit/article_cubit.dart';
import 'package:world_news/data/models/article.dart';
import 'package:world_news/helper/colors_manager.dart';
import 'package:world_news/helper/string_manager.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  late List<ArticleModel> articles = [];
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    articles = BlocProvider.of<ArticleCubit>(context).fetchHeadlines();
    tabController = TabController(length: 6, vsync: this);
  }

  final List<Tab> _tab = const [
    Tab(text: StringManager.trend),
    Tab(text: StringManager.business),
    Tab(text: StringManager.sports),
    Tab(text: StringManager.entertainment),
    Tab(text: StringManager.science),
    Tab(text: StringManager.technology),
  ];

  final List<BottomNavigationBarItem> _navBottomBar = const [
    BottomNavigationBarItem(
      label: '',
      icon: Icon(Icons.home),
    ),
    BottomNavigationBarItem(
      label: '',
      icon: Icon(Icons.search),
    ),
    BottomNavigationBarItem(
      label: '',
      icon: Icon(Icons.location_city_outlined),
    ),
    BottomNavigationBarItem(
      label: '',
      icon: Icon(Icons.settings),
    ),
  ];

  final List<Widget> _screens = const [
    Center(
      child: Text("It's cloudy here"),
    ),
    Center(
      child: Text("It's rainy here"),
    ),
    Center(
      child: Text("It's sunny here"),
    ),
    Center(
      child: Text("It's sunny here"),
    ),
    Center(
      child: Text("It's sunny here"),
    ),
    Center(
      child: Text("It's sunny here"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('World News'),
        bottom: TabBar(
          indicatorColor: ColorsManager.seletedColor,
          controller: tabController,
          indicatorSize: TabBarIndicatorSize.label,
          isScrollable: true,
          tabs: _tab,
        ),
        actions: [
          IconButton(
            onPressed: () {
              // move to bookmarks screen.
            },
            icon: Icon(
              Icons.bookmark,
              color: Theme.of(context).iconTheme.color,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _navBottomBar,
        // onTap: (value) => print(object),
      ),
      body: TabBarView(
        controller: tabController,
        children: _screens,
      ),
    );
  }
}
