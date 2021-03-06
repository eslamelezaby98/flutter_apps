import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../data/models/article.dart';
import '../../data/repos/article_repos.dart';

part 'article_state.dart';

class ArticleCubit extends Cubit<ArticleState> {
  final ArticleRepos articleRepos;
  late List<ArticleModel> articles = [];
  late List<ArticleModel> articlesByCategory = [];

  ArticleCubit(this.articleRepos) : super(ArticleInitial());

  List<ArticleModel> fetchHeadlines() {
    articleRepos.fetchTrendingArticles().then((articles) {
      emit(ArticelLoaded(articles));
      this.articles = articles;
    });
    return articles;
  }

  List<ArticleModel> fetchArticleByCategory(String category) {
    articleRepos.fetchArticlesByCategory(category).then((articles) {
      emit(ArticelLoaded(articles));
      this.articles = articles;
    });
    return articles;
  }
}
