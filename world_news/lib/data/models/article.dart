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
      author: json[ConstantsManager.author] ?? 'No author',
      title: json[ConstantsManager.title] ?? 'No title.',
      description: json[ConstantsManager.description] ?? 'No description fot this article..',
      url: json[ConstantsManager.url] ?? 'No url fot this article..',
      urlToImage: json[ConstantsManager.urlToImage] ??
          'https://www.generationsforpeace.org/wp-content/uploads/2018/07/empty.jpg',
      publishedAt: json[ConstantsManager.publishedAt] ?? 'No data fot this article..',
      content: json[ConstantsManager.content] ?? 'No content',
    );
  }
}
