import 'package:dio/dio.dart';
import 'package:news_app/app_manager/constants_manager.dart';
import 'package:news_app/models/article.dart';

class WebService {
  var dio = Dio();

  Future<List<Article>> fetchHeadlineByCountry(String country) async {
    final response = await dio.get(ContantsManager.headlinesFor(country));
    if (response.statusCode == 200) {
      final result = response.data;
      Iterable articlesList = result['articles'];
      return articlesList.map((article) => Article.fromJson(article)).toList();
    } else {
      throw Exception("Error when fetchHeadlineByCountry");
    }
  }

  Future<List<Article>> fetchTopHeadlines() async {
    String url = ContantsManager.topHeadlinesUrl;
    final response = await dio.get(url);

    if (response.statusCode == 200) {
      final result = response.data;
      Iterable articlesList = result['articles'];

      return articlesList.map((article) => Article.fromJson(article)).toList();
    } else {
      throw Exception("Error when fetchTopHeadlines");
    }
  }
}
