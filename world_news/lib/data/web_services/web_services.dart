import 'package:dio/dio.dart';
import 'package:world_news/data/models/article.dart';
import 'package:world_news/helper/constants.dart';

class ArticelWebServices {
  late Dio dio;

  ArticelWebServices() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: ConstantsManager.baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 10 * 1000,
      receiveTimeout: 10 * 1000,
    );
    dio = Dio(baseOptions);
  }

  Future<List<ArticleModel>> fetchTrendingArticles() async {
    try {
      Response response = await dio.get(ConstantsManager.baseUrl);
      if (response.statusCode == 200) {
        final result = response.data;
        Iterable articles = result['articles'];
        return articles
            .map((article) => ArticleModel.fromJsom(article))
            .toList();
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  Future<List<ArticleModel>> fetchArticlesByCategory(
      String category) async {
    try {
      Response response =
          await dio.get(ConstantsManager.getCategoryUrl(category));
      if (response.statusCode == 200) {
        final result = response.data;
        Iterable articlesByCategory = result['articles'];
        return articlesByCategory
            .map((article) => ArticleModel.fromJsom(article))
            .toList();
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}
