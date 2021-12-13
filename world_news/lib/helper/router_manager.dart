import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_news/business_logic/cubit/article_cubit.dart';
import 'package:world_news/data/repos/article_repos.dart';
import 'package:world_news/data/web_services/web_services.dart';
import 'package:world_news/presentation/screens/category_screen.dart';
import 'package:world_news/presentation/screens/main_screen.dart';

class Routes {
  static const String mainSreen = '/';
  static const String trendingScreen = '/trendingScreen';
  static const String buisnessScreen = '/buisnessScreen';
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
