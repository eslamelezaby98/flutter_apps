class ConstantsManager {
  //TODO: remmber to remove my key.
  static const String myKey = 'c6d6f7b94b9b4ef1be2768001d1db29d';
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
