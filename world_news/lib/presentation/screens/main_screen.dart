import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_news/business_logic/cubit/article_cubit.dart';
import 'package:world_news/data/models/article.dart';
import 'package:world_news/helper/colors_manager.dart';
import 'package:world_news/helper/constants.dart';
import 'package:world_news/helper/string_manager.dart';
import 'package:world_news/presentation/screens/trending_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  late TabController tabController;
  List<ArticleModel> articles = [];

  @override
  void initState() {
    super.initState();
    tabController =
        TabController(length: ConstantsManager.categories.length, vsync: this);
    BlocProvider.of<ArticleCubit>(context)
        .fetchArticleByCategory(ConstantsManager.categories[1]);
  }

  getTab(int index) {
    return Tab(
      text: ConstantsManager.categories[index].toUpperCase(),
    );
  }

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
        children: [
          for (var i = 0; i < ConstantsManager.categories.length; i++)
            TrendingScreen(
              index: i,
              title: ConstantsManager.categories[i].toUpperCase(),
            ),
        ],
      ),
    );
  }
}
