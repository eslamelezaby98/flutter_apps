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
      title: json[ContantsManager.kTitle] ?? "No title found",
      description: json[ContantsManager.kDescription] ?? "No description found",
      url: json[ContantsManager.kUrl] ?? "No url found",
      urlToImage: json[ContantsManager.kUrlToImage] ?? "https://www.ecpgr.cgiar.org/fileadmin/templates/ecpgr.org/Assets/images/No_Image_Available.jpg",
      publishedAt: json[ContantsManager.kPublishedAt] ?? "No data found",
      content: json[ContantsManager.kConent] ?? "No content found",
    );
  }
}
