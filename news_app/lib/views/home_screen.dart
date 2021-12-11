import 'package:flutter/material.dart';
import 'package:news_app/app_manager/color_manager.dart';
import 'package:news_app/app_manager/strings_manager.dart';
import 'package:news_app/views/category_screen.dart';
import 'package:news_app/views/country_screen.dart';
import 'package:news_app/views/setting_screen.dart';
import 'package:news_app/views_model/article_list_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> sceens = [
    const TrendingScreen(),
    const CategoryScreen(),
    const CountryScreen(),
    const SettingScreen(),
  ];

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: sceens.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: ColorManager.blue,
          unselectedItemColor: ColorManager.white,
          selectedItemColor: ColorManager.black,
          selectedLabelStyle: Theme.of(context).textTheme.subtitle1,
          unselectedLabelStyle: Theme.of(context).textTheme.caption,
          currentIndex: _currentIndex,
          onTap: (value) {
            setState(() {
              _currentIndex = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
              label: 'Trending',
              icon: Icon(Icons.today),
            ),
            BottomNavigationBarItem(
              label: 'Category',
              icon: Icon(Icons.category),
            ),
            BottomNavigationBarItem(
              label: 'Country',
              icon: Icon(Icons.location_city),
            ),
            BottomNavigationBarItem(
              label: 'Setting',
              icon: Icon(Icons.settings),
            ),
          ]),
    );
  }
}

class TrendingScreen extends StatefulWidget {
  const TrendingScreen({Key? key}) : super(key: key);

  @override
  State<TrendingScreen> createState() => _TrendingScreenState();
}

class _TrendingScreenState extends State<TrendingScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<ArticlesListViewModel>(context, listen: false).fetchHeadlines();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ArticlesListViewModel>(context);
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          floating: true,
          snap: false,
          expandedHeight: 200,
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(
            StringsManager.trend,
            style: Theme.of(context).textTheme.headline1,
          ),
          flexibleSpace: FlexibleSpaceBar(
            background: Image.network(
              provider.articlList[10].urlToImage,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: Stack(
                  children: [
                    Container(
                      height: 300,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: NetworkImage(
                            provider.articlList[index].urlToImage,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        provider.articlList[index].title,
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              provider.articlList[index].publishedAt,
                              style: Theme.of(context).textTheme.headline2,
                            ),
                            Text(
                              'By Author : ${provider.articlList[index].author}',
                              style: Theme.of(context).textTheme.headline2,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            childCount: provider.articlList.length,
          ),
        ),
      ],
    );
  }
}
