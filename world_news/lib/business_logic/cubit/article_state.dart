part of 'article_cubit.dart';

@immutable
abstract class ArticleState {}

class ArticleInitial extends ArticleState {}

class ArticelLoaded extends ArticleState {
  final List<ArticleModel> articles;

  ArticelLoaded(this.articles);
}
