import 'package:world_news/data/models/article.dart';
import 'package:world_news/data/web_services/web_services.dart';

class ArticleRepos {
  ArticelWebServices articelWebServices;

  ArticleRepos({required this.articelWebServices});

  Future<List<dynamic>> fetchTrendingArticles() async {
    final artcile = await articelWebServices.fetchTrendingArticles();
    var articleList =
        artcile.map((value) => ArticleModel.fromJsom(value)).toList();
    return articleList;
  }
}
