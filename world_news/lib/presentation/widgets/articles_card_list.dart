import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../business_logic/cubit/article_cubit.dart';
import '../../data/models/article.dart';
import '../../helper/colors_manager.dart';
import '../../helper/constants.dart';
import 'article_card.dart';


class ArticlesCardList extends StatefulWidget {
  final List<ArticleModel> articleModel;
  final String title;
  final int index;

  const ArticlesCardList({
    Key? key,
    required this.articleModel,
    required this.title,
    required this.index,
  }) : super(key: key);

  @override
  State<ArticlesCardList> createState() => _ArticlesCardListState();
}

class _ArticlesCardListState extends State<ArticlesCardList> {
  @override
  void initState() {
    super.initState();
    // BlocProvider.of<ArticleCubit>(context).fetchHeadlines();
    BlocProvider.of<ArticleCubit>(context)
        .fetchArticleByCategory(ConstantsManager.categories[widget.index]);
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: true,
          snap: true,
          pinned: false,
          centerTitle: false,
          backgroundColor: ColorsManager.primaryDark,
          title: Text(
            widget.title,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        ArticleCard(articleModel: widget.articleModel),
      ],
    );
  }
}
