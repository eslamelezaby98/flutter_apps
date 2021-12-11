import 'package:flutter/material.dart';
import 'package:news_app/app_manager/route_manager.dart';
import 'package:news_app/app_manager/app_theme_manager.dart';
import 'package:news_app/models/country_model.dart';
import 'package:news_app/views_model/article_list_view_model.dart';
import 'package:news_app/views_model/country_model_view.dart';
import 'package:news_app/views_model/home_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ArticlesListViewModel>(
          create: (context) => ArticlesListViewModel(),
        ),
        ChangeNotifierProvider<HomeViewModel>(
          create: (context) => HomeViewModel(),
        ),
        ChangeNotifierProvider<CountryModel>(
          create: (context) => CountryModel(),
        ),
      ],
      child: MaterialApp(
        theme: AppThemeManager.getAppTheme(),
        onGenerateRoute: RoutesGenerator.getRoute,
        initialRoute: Routes.homeScreen,
      ),
    );
  }
}
