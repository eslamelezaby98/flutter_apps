import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import '../../business_logic/cubit/article_cubit.dart';
import '../../data/models/article.dart';
import '../../helper/constants.dart';
import 'home_screen.dart';
import 'setting_screen.dart';
import 'trending_screen.dart';

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
  late final ArticleModel article;

  final screen = [
    const HomeScreen(),
    const TrendingScreen(),
    //  const  BookmarksScreen(),
    const SettingScreen(),
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
      icon: Icon(Icons.settings),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return OfflineBuilder(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          Text(
            'There are no bottons to push :)',
          ),
          Text(
            'Just turn off your internet.',
          ),
        ],
      ),
      connectivityBuilder: (
        context,
        ConnectivityResult connectivity,
        Widget child,
      ) {
        final bool connected = connectivity != ConnectivityResult.none;

        if (connected) {
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
        } else {
          return SafeArea(
            child: Scaffold(
              body: Stack(
                fit: StackFit.expand,
                children: [
                  Positioned(
                    height: 24.0,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                      color: connected
                          ? const Color(0xFF00EE44)
                          : const Color(0xFFEE4400),
                      child: Center(
                        child: connected
                            ? const Text('ONLINE')
                            : const Text('OFFLINE'),
                      ),
                    ),
                  ),
                  const Center(
                    child: Image(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'assets/images/offline.gif',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
