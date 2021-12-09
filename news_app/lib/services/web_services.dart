import 'dart:convert';
import 'package:news_app/app_manager/constants_manager.dart';
import 'package:news_app/models/article.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/models/article_list.dart';

class WebService {

  Future<List<Article>> fetchHeadline() async {
    try {
      final response =
          await http.get(Uri.parse(ContantsManager.topHeadlinesUrl));
      if (response.statusCode == 200) {
        final String data = response.body;
        dynamic jsonData = jsonDecode(data);
        ArticlesList articleList = ArticlesList.fromJson(jsonData);
        List<Article> article = articleList.articleList
            .map((article) => Article.fromJson(article))
            .toList();
        return article;
      } else {
        throw AssertionError('Error');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  fetchHeadlineByCountry(String country) async {
    try {
      final response = await http.get(
        Uri.parse(
          ContantsManager.headlinesFor(country),
        ),
      );
      if (response.statusCode == 200) {
        String data = response.body;
        var jsonData = jsonDecode(data);
        ArticlesList list = ArticlesList.fromJson(jsonData);
        List<Article> article = list.articleList
            .map((article) => Article.fromJson(article))
            .toList();
        return article;
      } else {
        throw AssertionError('Error');
      }
    } catch (e) {
      throw AssertionError(e);
    }
  }
}
