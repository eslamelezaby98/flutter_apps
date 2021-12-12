import 'package:world_news/data/models/article.dart';
import 'package:world_news/data/web_services/web_services.dart';

class ArticleRepos {
  ArticelWebServices articelWebServices;

  ArticleRepos({required this.articelWebServices});

  Future<List<ArticleModel>> fetchTrendingArticles()  async{
    final artcile =await  articelWebServices.fetchTrendingArticles();
    // var articles =
    //     artcile.map((article) => ArticleModel.fromJsom(article)).toList();
    return artcile;
  }
}
