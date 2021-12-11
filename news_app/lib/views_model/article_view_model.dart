import 'package:intl/intl.dart';
import 'package:news_app/models/article.dart';

class ArticleViewModel {
  final Article _newArticle;
  ArticleViewModel({required Article article}) : _newArticle = article;

  String get title => _newArticle.title;
  String get description => _newArticle.description;
  String get url => _newArticle.url;
  String get urlToImage => _newArticle.urlToImage;
  String get author => _newArticle.author;

  String get publishAt{
    final dateTime = DateFormat('yyyy-MM-ddTHH:mm:ssZ').parse(_newArticle.publishedAt, true);
    return DateFormat.yMMMMEEEEd('en-us').format(dateTime).toString();
  }
}
