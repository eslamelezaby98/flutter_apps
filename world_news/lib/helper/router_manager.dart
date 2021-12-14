import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../business_logic/cubit/article_cubit.dart';
import '../data/models/article.dart';
import '../data/repos/article_repos.dart';
import '../data/web_services/web_services.dart';
import '../presentation/screens/article_detials_screen.dart';
import '../presentation/screens/bookmarks_screen.dart';
import '../presentation/screens/category_screen.dart';
import '../presentation/screens/main_screen.dart';

class Routes {
  static const String mainSreen = '/';
  static const String trendingScreen = '/trendingScreen';
  static const String bookmarksScreen = '/bookmarksScreen';
   static const String articleDetialsScreen = '/articleDetialsScreen';
}

class RoutesGenerator {
  late ArticleRepos articleRepos;
  late ArticleCubit articleCubit;
  late int index;
  late String title;

  RoutesGenerator() {
    articleRepos = ArticleRepos(articelWebServices: ArticelWebServices());
    articleCubit = ArticleCubit(articleRepos);
  }

  Route? generateRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.mainSreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => articleCubit,
            child: const MainScreen(),
          ),
        );
      case Routes.trendingScreen:
        return MaterialPageRoute(
          builder: (_) => CategoryScreen(
            index: index,
            title: title,
          ),
        );
      case Routes.bookmarksScreen:
        // final article = routeSettings.arguments as ArticleModel;
        return MaterialPageRoute(
          builder: (_) =>const  BookmarksScreen(),
        );
        case Routes.articleDetialsScreen:
        final article = routeSettings.arguments as ArticleModel;
        return MaterialPageRoute(
          builder: (_) =>  ArticleDetialsScreen(articleModel: article),
        );
      default:
        unDefindRoute();
    }
  }

  static Route<dynamic> unDefindRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Not Found Route'),
        ),
        body: const Center(
          child: Text('Not Found Route'),
        ),
      ),
    );
  }
}
