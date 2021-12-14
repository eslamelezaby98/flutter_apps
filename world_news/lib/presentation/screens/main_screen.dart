import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_news/business_logic/cubit/article_cubit.dart';
import 'package:world_news/data/models/article.dart';
import 'package:world_news/helper/constants.dart';
import 'package:world_news/presentation/screens/bookmarks_screen.dart';
import 'package:world_news/presentation/screens/home_screen.dart';
import 'package:world_news/presentation/screens/trending_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  // List<ArticleModel> articles = [];

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ArticleCubit>(context)
        .fetchArticleByCategory(ConstantsManager.categories[1]);
  }

  int _currentIndex = 0;
  late final ArticleModel article ;

  final screen = [
    const HomeScreen(),
    const TrendingScreen(),
   const  BookmarksScreen(),
    const Center(
      child: Text('setting'),
    ),
  ];

  final List<BottomNavigationBarItem> _navBottomBar = const [
    BottomNavigationBarItem(
      label: '',
      icon: Icon(Icons.home),
    ),
    BottomNavigationBarItem(
      label: '',
      icon: Icon(Icons.golf_course_sharp),
    ),
    BottomNavigationBarItem(
      label: '',
      icon: Icon(Icons.bookmark),
    ),
    BottomNavigationBarItem(
      label: '',
      icon: Icon(Icons.settings),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: _navBottomBar,
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
      ),
      body: screen.elementAt(_currentIndex),
    );
  }
}
