import 'package:flutter/cupertino.dart';
import 'package:news_app/models/article.dart';
import 'package:news_app/services/web_services.dart';

class ArticlesListViewModel extends ChangeNotifier {
  List<Article> _articlList = [];
  List<Article> _articlesByCountry = [];

  List<Article> get articlList => _articlList;
  List<Article> get articlesByCountry => _articlesByCountry;

  Future<void> fetchHeadlines() async {
    _articlList = await WebService().fetchHeadline();
    notifyListeners();
  }

  Future<void> fetchHeadlinesByCountry(String country) async {
    _articlesByCountry = await WebService().fetchHeadlineByCountry(country);
    notifyListeners();
  }
}
