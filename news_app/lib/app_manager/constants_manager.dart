import 'package:news_app/keys/my_key.dart';

class ContantsManager {
  static const String kTitle = 'title';
  static const String kAuthor = 'author';
  static const String kDescription = 'description';
  static const String kUrl = 'url';
  static const String kUrlToImage = 'urlToImage';
  static const String kPublishedAt = 'publishedAt';
  static const String kConent = 'content';
  static const String kArticles = 'articles';

//API
  static const topHeadlinesUrl =
      'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=$apiKey';

  static String headlinesFor(String country) {
    return 'https://newsapi.org/v2/top-headlines?country=$country&category=business&apiKey=$apiKey';
  }

  static const Map<String, String> countries = {
    "United States of America": "us",
    "India": "in",
    "Korea": "kr",
    "China": "ch",
    "Egypt": "eg"
  };

  static const List<String> countriesNames = [
    "Trends",
    "United States of America",
    "Egypt",
    "India",
    "Korea",
    "China"
  ];
}
