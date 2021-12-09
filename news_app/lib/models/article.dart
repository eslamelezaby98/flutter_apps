
import 'package:news_app/app_manager/constants_manager.dart';

class Article {
  final String title;
  final String author;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;

  Article({
    required this.title,
    required this.author,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
        title: json[ContantsManager.kTitle],
        author: json[ContantsManager.kAuthor],
        description: json[ContantsManager.kDescription],
        url: json[ContantsManager.kUrl],
        urlToImage: json[ContantsManager.kUrlToImage],
        publishedAt: json[ContantsManager.kPublishedAt],
        content: json[ContantsManager.kConent]);
  }

  Map<String, dynamic> toJson() {
    return {
      ContantsManager.kTitle: title,
      ContantsManager.kAuthor: author,
      ContantsManager.kDescription: description,
      ContantsManager.kUrl: url,
      ContantsManager.kUrlToImage: urlToImage,
      ContantsManager.kPublishedAt: publishedAt,
      ContantsManager.kConent: content
    };
  }
}
