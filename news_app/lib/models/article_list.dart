import 'package:news_app/app_manager/constants_manager.dart';

class ArticlesList {
  final List<dynamic> articleList;
  ArticlesList({required this.articleList});
  factory ArticlesList.fromJson(Map<String, dynamic> jsonData) {
    return ArticlesList(articleList: jsonData[ContantsManager.kArticles]);
  }
}