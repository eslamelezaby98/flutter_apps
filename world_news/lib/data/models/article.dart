import 'package:world_news/helper/constants.dart';

class ArticleModel {
  late String author;
  late String title;
  late String description;
  late String url;
  late String urlToImage;
  late String publishedAt;
  late String content;

  ArticleModel({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

//Remmber if value is null ?? new_value
  factory ArticleModel.fromJsom(Map<String, dynamic> json) {
    return ArticleModel(
      author: json[ConstantsManager.author] ?? 'error',
      title: json[ConstantsManager.title] ?? 'error',
      description: json[ConstantsManager.description] ?? 'error',
      url: json[ConstantsManager.url] ?? 'error',
      urlToImage: json[ConstantsManager.urlToImage] ?? 'https://www.generationsforpeace.org/wp-content/uploads/2018/07/empty.jpg',
      publishedAt: json[ConstantsManager.publishedAt] ?? 'error',
      content: json[ConstantsManager.content] ?? 'error',
    );
  }
}
