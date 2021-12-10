import 'package:news_app/app_manager/constants_manager.dart';

class Article {
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;

  Article({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  static Map<String, String> nullValue = {'null': 'null'};

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      author: json[ContantsManager.kAuthor] ?? "No author found",
      title: json[ContantsManager.kTitle],
      description: json[ContantsManager.kDescription],
      url: json[ContantsManager.kUrl],
      urlToImage: json[ContantsManager.kUrlToImage],
      publishedAt: json[ContantsManager.kPublishedAt],
      content: json[ContantsManager.kConent] ?? "No content found",
    );
  }
}
