import 'package:intl/intl.dart';
import 'package:news_app/models/article.dart';

class ArticleViewModel {
  final Article _article;
  ArticleViewModel({required Article article}) : _article = article;

  String get title => _article.title;

  String get decscription => _article.description;

  String get author => _article.author;

  String get url => _article.url;

  String get urlToImage => _article.urlToImage;

  String get content => _article.content;

  String get publishedAt {
    final dateTime =
        DateFormat('yyyy-MM-ddTHH:mm:ssZ').parse(_article.publishedAt, true);
    return DateFormat.yMMMMEEEEd('en-us').format(dateTime).toString();
  }
}
