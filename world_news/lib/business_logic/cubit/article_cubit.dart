import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:world_news/data/models/article.dart';
import 'package:world_news/data/repos/article_repos.dart';

part 'article_state.dart';

class ArticleCubit extends Cubit<ArticleState> {
  final ArticleRepos articleRepos;
  late List<ArticleModel> articles = [];

  ArticleCubit(this.articleRepos) : super(ArticleInitial());

  List<ArticleModel> fetchHeadlines() {
    articleRepos.fetchTrendingArticles().then((articles) {
      emit(ArticelLoaded(articles));
      this.articles = articles;
    });
    return articles;
  }
}
