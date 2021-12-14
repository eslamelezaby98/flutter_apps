import '../models/article.dart';
import '../web_services/web_services.dart';

class ArticleRepos {
  ArticelWebServices articelWebServices;

  ArticleRepos({required this.articelWebServices});

  Future<List<ArticleModel>> fetchTrendingArticles() async {
    final artcile = await articelWebServices.fetchTrendingArticles();
    return artcile;
  }

  Future<List<ArticleModel>> fetchArticlesByCategory(String category) async {
    final artcile = await articelWebServices.fetchArticlesByCategory(category);
    return artcile;
  }

}
