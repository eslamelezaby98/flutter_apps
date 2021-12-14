class ConstantsManager {
  static const String myKey = 'YUOR KEY';
  static const String baseUrl =
      'https://newsapi.org/v2/top-headlines?country=us&apiKey=$myKey';
  static const String author = 'author';
  static const String title = 'title';
  static const String description = 'description';
  static const String url = 'url';
  static const String urlToImage = 'urlToImage';
  static const String publishedAt = 'publishedAt';
  static const String content = 'content';

  // API => category
  static String getCategoryUrl(String category) {
    return 'https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=$myKey';
  }

  static List<String> categories = [
    'business',
    'entertainment',
    'general',
    'health',
    'science',
    'sports',
    'technology'
  ];

  static const String name = 'name';
  static const String categoryUrl = 'url';
  static const String categoryDescription = 'description';
}
