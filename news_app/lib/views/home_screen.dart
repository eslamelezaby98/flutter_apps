import 'package:flutter/material.dart';
import 'package:news_app/app_manager/app_size_manager.dart';
import 'package:news_app/app_manager/color_manager.dart';
import 'package:news_app/app_manager/constants_manager.dart';
import 'package:news_app/app_manager/strings_manager.dart';
import 'package:news_app/views_model/article_list_view_model.dart';
import 'package:news_app/views_model/home_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<ArticlesListViewModel>(context, listen: false).fetchHeadlines();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ArticlesListViewModel>(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: true,
            snap: false,
            expandedHeight: 200,
            backgroundColor: ColorManager.blue,
            flexibleSpace: FlexibleSpaceBar(
              
              title: Text(
                'Trending',
                style: Theme.of(context).textTheme.headline1,
              ),
              background: Image.network(
                provider.articlList[1].urlToImage,
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
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                              Text(
                                'By Author : ${provider.articlList[index].author}',
                                style: Theme.of(context).textTheme.caption,
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
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: ColorManager.blue,
        unselectedItemColor: ColorManager.white,
        selectedItemColor: ColorManager.blue,
        // selectedLabelStyle: ,
        items: const [
        BottomNavigationBarItem(
          label: 'Trending',
          icon: Icon(Icons.today),
        ),
        BottomNavigationBarItem(
          label: 'Trending',
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
