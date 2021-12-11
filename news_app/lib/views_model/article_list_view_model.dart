import 'package:flutter/cupertino.dart';
import 'package:news_app/models/article.dart';
import 'package:news_app/services/web_services.dart';
import 'package:news_app/views_model/article_view_model.dart';

enum LoadingState {
  completed,
  searching,
  empty,
}

class ArticlesListViewModel extends ChangeNotifier {
  LoadingState loadingState = LoadingState.searching;
  List<ArticleViewModel> articleList = <ArticleViewModel>[];

  // List<Article> _articlList = [];
  // List<Article> _articlesByCountry = [];

  // List<Article> get articlList => _articlList;
  // List<Article> get articlesByCountry => _articlesByCountry;

  fetchHeadlines() async {
    List<Article> articles = await WebService().fetchHeadline();
    notifyListeners();
    articleList =
        articles.map((article) => ArticleViewModel(article: article)).toList();

    if (articleList.isEmpty) {
      loadingState = LoadingState.empty;
    } else {
      loadingState = LoadingState.empty;
    }
    notifyListeners();
  }

  fetchHeadlinesByCountry(String country) async {
    List<Article> articles = await WebService().fetchHeadlineByCountry(country);
    notifyListeners();
    articleList = articles.map((e) => ArticleViewModel(article: e)).toList();
    if (articleList.isEmpty) {
      loadingState = LoadingState.empty;
    } else {
      loadingState = LoadingState.empty;
    }
  }
}
